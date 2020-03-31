package cn.shop.service.back.impl;

import cn.shop.dbc.DatabaseConnection;
import cn.shop.factory.DAOFactory;
import cn.shop.service.back.IAdminServiceBack;
import cn.shop.vo.Admin;

public class AdminServiceBackImpl implements IAdminServiceBack {
    private DatabaseConnection dbc = new DatabaseConnection() ;
    @Override
    public boolean login(Admin vo) throws Exception {
        try {
            if (DAOFactory.getIAdminDAOInstance(this.dbc.getConnection()).findLogin(vo)) {
                return DAOFactory.getIAdminDAOInstance(this.dbc.getConnection()).doUpdateLastDate(vo.getAid()) ;
            }
            return false ;
        }catch (Exception e) {
            throw e ;
        } finally {
            this.dbc.close();
        }
    }
}
