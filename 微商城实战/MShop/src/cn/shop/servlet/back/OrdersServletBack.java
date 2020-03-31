package cn.shop.servlet.back;

import cn.shop.factory.ServiceBackFactory;
import cn.shop.vo.Orders;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "OrdersServletBack",urlPatterns = "/pages/back/admin/orders/OrdersServletBack/*")
public class OrdersServletBack extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "/pages/errors.jsp" ;
        String status = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1) ;
        if (status != null) {
            if ("list".equals(status)) {
                path = this.list(request) ;
            } else if ("show".equals(status)) {
                path = this.show(request) ;
            }
        }
        request.getRequestDispatcher(path).forward(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    public String list(HttpServletRequest request) {
        int currentPage = 1 ;
        int lineSize = 5 ;
        String column = null ;
        String keyWord = null ;
        String columnData = "购买用户:mid" ;
        try {
            currentPage = Integer.parseInt(request.getParameter("cp")) ;
        } catch (Exception e) {}
        try {
            lineSize = Integer.parseInt(request.getParameter("ls")) ;
        } catch (Exception e) {}
        column = request.getParameter("col") ;
        keyWord = request.getParameter("kw") ;
        if (column == null) {
            column = "mid" ;
        }
        if (keyWord == null) {
            // 表示查询全部
            keyWord = "" ;
        }
        try {
            String mid = (String) request.getSession().getAttribute("mid") ;
            Map<String,Object> map = ServiceBackFactory.getIOrdersServiceBackInstance().list(currentPage,lineSize,column,keyWord) ;

            request.setAttribute("allOrders",map.get("allOrders"));
            request.setAttribute("allRecorders",map.get("ordersCount"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("currentPage",currentPage);
        request.setAttribute("lineSize",lineSize);
        request.setAttribute("columnData",columnData);
        request.setAttribute("column",column);
        request.setAttribute("keyWord",keyWord);
        request.setAttribute("url","/pages/back/admin/orders/OrdersServletBack/list");
        return "/pages/back/admin/orders/orders_list.jsp" ;
    }

    public String show(HttpServletRequest request) {
        int oid = Integer.parseInt(request.getParameter("oid")) ;
        try {
            Orders vo = ServiceBackFactory.getIOrdersServiceBackInstance().show(oid) ;
            request.setAttribute("orders",vo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/pages/back/admin/orders/orders_show.jsp" ;
    }
}
