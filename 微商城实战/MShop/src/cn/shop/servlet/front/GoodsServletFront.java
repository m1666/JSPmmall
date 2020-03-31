package cn.shop.servlet.front;

import cn.shop.factory.ServiceFrontFactory;
import cn.util.validate.ValidateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "GoodsSservletFront",urlPatterns = "/pages/front/goods/GoodsServletFront/*")
public class GoodsServletFront extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "/pages/errors.jsp" ;
        String status = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1) ;
        if (status != null) {
            if ("list".equals(status)) {
                path = this.list(request) ;
            } else if ("show".equals(status)) {
                path = this. show(request) ;
            }
        }
        request.getRequestDispatcher(path).forward(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
    
    public String list(HttpServletRequest request) {
        String iid = request.getParameter("iid") ; // 先接收IID数据
        int currentPage = 1 ;
        int lineSize = 5 ;
        String column = null ;
        String keyWord = null ;
        String columnData = "商品名称:title|发布管理员:aid" ;
        try {
            currentPage = Integer.parseInt(request.getParameter("cp")) ;
        } catch (Exception e) {}
        try {
            lineSize = Integer.parseInt(request.getParameter("ls")) ;
        } catch (Exception e) {}
        column = request.getParameter("col") ;
        keyWord = request.getParameter("kw") ;
        if (column == null) {
            column = "title" ;
        }
        if (keyWord == null) {
            keyWord = "" ; // 表示查询全部
        }
        try {
            Map<String,Object> map = null ;
            if (iid == null || "0".equals(iid) || "null".equals(iid)) { // 属于查询全部
                iid = "0" ;
                map =  ServiceFrontFactory.getIGoodsServiceFrontInstance().list(currentPage,lineSize,column,keyWord) ;
            } else { // 要根据item分类进行商品信息查询
                map =  ServiceFrontFactory.getIGoodsServiceFrontInstance().listByItem(Integer.parseInt(iid),currentPage,lineSize,column,keyWord) ;
            }
            request.setAttribute("allItems",map.get("allItems"));
            request.setAttribute("allGoods",map.get("allGoods"));
            request.setAttribute("allRecorders",map.get("goodsCount"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("currentPage",currentPage);
        request.setAttribute("lineSize",lineSize);
        request.setAttribute("column",column);
        request.setAttribute("keyWord",keyWord);
        request.setAttribute("columnData",columnData);
        request.setAttribute("url","/pages/front/goods/GoodsServletFront/list");
        request.setAttribute("paramName","iid");
        request.setAttribute("paramValue",iid);
        return "/pages/front/goods/goods_list.jsp" ;
    }
    
    public String show(HttpServletRequest request) {
        String msg = null ;
        String url = null ;
        String referer = request.getHeader("referer") ; // 取得之前的路径
        String gid = request.getParameter("gid") ;
        if (ValidateUtil.validateRegex(gid,"\\d+")) { // 是数字
            try {
                request.setAttribute("goods",ServiceFrontFactory.getIGoodsServiceFrontInstance().show(Integer.parseInt(gid)));
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "/pages/front/goods/goods_show.jsp" ;
        } else {
            msg = "您所选择的商品信息有误，请重新选择！" ;
            url = referer ;
            return "/pages/forward.jsp" ;
        }
    }
}
