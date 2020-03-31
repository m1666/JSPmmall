package cn.shop.factory;

import cn.shop.service.front.IGoodsServiceFront;
import cn.shop.service.front.IMemberServiceFront;
import cn.shop.service.front.IOrdersServiceFront;
import cn.shop.service.front.IShopcarServiceFront;
import cn.shop.service.front.impl.GoodsServiceFrontImpl;
import cn.shop.service.front.impl.MemberServiceFrontImpl;
import cn.shop.service.front.impl.OrdersServiceFrontImpl;
import cn.shop.service.front.impl.ShopcarServiceFrontImpl;

public class ServiceFrontFactory {
    public static IMemberServiceFront getIMemberServiceFrontInstance() {
        return  new MemberServiceFrontImpl() ;
    }
    
    public static IGoodsServiceFront getIGoodsServiceFrontInstance() {
        return new GoodsServiceFrontImpl() ; 
    }
    
    public  static IShopcarServiceFront getIShopcarServiceFrontInstance() {
        return new ShopcarServiceFrontImpl() ;
    }

    public static IOrdersServiceFront getIOrdersServiceFrontInstance() {
        return new OrdersServiceFrontImpl() ;
    }
}
