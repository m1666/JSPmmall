package cn.shop.service.back;

        import cn.shop.vo.Admin;

public interface IAdminServiceBack {
    /**
     * 实现管理员的登录操作，本操作要执行如下代码：<br>
     *     <li>调用IAdminDAO.findLogin()方法确定用户名和密码是否正确 ，如果正确返回最后一次登录日期；</li>
     *     <li>调用IAdminDAO.doUpdateLastdate()方法，更新最后一次的登录日期</li>
     * @param vo 只包含有aid与password
     * @return 登录成功反回true，否则返回false
     * @throws Exception
     */
    public boolean login(Admin vo) throws Exception ;
}
