package cn.shop.servlet.front;

import cn.shop.factory.ServiceFrontFactory;
import cn.shop.vo.Member;
import cn.util.BasePath;
import cn.util.CookieUtil;
import cn.util.MD5Code;
import cn.util.validate.ValidateUtil;
import com.jspsmart.upload.SmartUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

@WebServlet(name = "MemberInfoServletFront",urlPatterns = "/pages/front/member/MemberInfoServletFront/*")
public class MemberInfoServletFront extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "/pages/errors.jsp";
        String status = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
        if (status != null) {
            if ("updatePre".equals(status)) {
                path = this.updatePre(request);
            } else if ("update".equals(status)) {
                path = this.update(request, response);
            }
        }
        request.getRequestDispatcher(path).forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    public String updatePre(HttpServletRequest request) {
        String mid = (String) request.getSession().getAttribute("mid");
        try {
            request.setAttribute("member", ServiceFrontFactory.getIMemberServiceFrontInstance().updatePre(mid));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/pages/front/member/member_update.jsp";
    }
    public String update(HttpServletRequest request, HttpServletResponse response) {
        String mid = (String) request.getSession().getAttribute("mid");
        SmartUpload smart = new SmartUpload();
        try {
            smart.initialize(super.getServletConfig(), request, response);
            smart.upload();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String name = smart.getRequest().getParameter("name");
        String phone = smart.getRequest().getParameter("phone");
        String address = smart.getRequest().getParameter("address");
        String oldpic = smart.getRequest().getParameter("oldpic");
        String msg = null;
        String url = null;
        if (ValidateUtil.validateEmpty(name) &&
                ValidateUtil.validateEmpty(phone) &&
                ValidateUtil.validateEmpty(address)) {
            Member vo = new Member();
            vo.setMid(mid);
            vo.setName(name);
            vo.setPhone(phone);
            vo.setAddress(address);
            try {
                if (smart.getFiles().getSize() > 0) {
                    if (smart.getFiles().getFile(0).getContentType().contains("image")) {
                        if ("nophoto.jpg".equals(oldpic)) { // 之前没有上传图片，需要重新生成名称
                            vo.setPhoto(UUID.randomUUID() + "." + smart.getFiles().getFile(0).getFileExt());
                        } else {
                            vo.setPhoto(oldpic);
                        }
                    } else {
                        vo.setPhoto(oldpic);
                    }
                } else {
                    vo.setPhoto(oldpic);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if (ServiceFrontFactory.getIMemberServiceFrontInstance().update(vo)) {
                    if (smart.getFiles().getSize() > 0) {
                        if (smart.getFiles().getFile(0).getContentType().contains("image")) {
                            String filePath = super.getServletContext().getRealPath("/upload/member/") + vo.getPhoto() ;
                            smart.getFiles().getFile(0).saveAs(filePath) ;
                        }
                    }
                    msg = "用户信息更新成功！";
                    url = "/pages/front/member/MemberInfoServletFront/updatePre";
                    request.getSession().setAttribute("photo", vo.getPhoto());
                } else {
                    msg = "用户信息更新失败！";
                    url = "/pages/front/member/MemberInfoServletFront/updatePre";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            msg = "更新数据不完整，请重新数据！";
            url = "/pages/front/member/MemberInfoServletFront/updatePre";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return "/pages/forward.jsp";
    }
}
