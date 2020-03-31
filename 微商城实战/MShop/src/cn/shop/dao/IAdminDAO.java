package cn.shop.dao;

import cn.shop.vo.Admin;

public interface IAdminDAO extends IDAO<String,Admin> {
    /**
     * 本操作实现管理员的登录功能，在登录完成之后需要将上一次的登陆时间取出
     * 传递的是一个VO类对象，所以直接将登陆日期设置到此对象中即可返回
     * @param vo 包含有aid与password数据
     * @return 登录成功返回true，否则返回false
     * @throws Exception
     */
    public boolean findLogin(Admin vo) throws Exception ;

    /**
     * 本操作是更新最后一次的登录日期，只需要传入更新的管理员编号即可
     * @param aid 管理员编号
     * @return 更新成功返回true，否则返回false
     * @throws Exception
     */
    public boolean doUpdateLastDate(String aid) throws Exception ;
}
