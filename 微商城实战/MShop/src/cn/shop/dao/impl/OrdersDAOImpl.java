package cn.shop.dao.impl;

import cn.shop.dao.IOrdersDAO;
import cn.shop.vo.Member;
import cn.shop.vo.Orders;
import cn.util.dao.AbstractDAOImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class OrdersDAOImpl extends AbstractDAOImpl implements IOrdersDAO {
    public OrdersDAOImpl(Connection conn) {
        super(conn);
    }

    @Override
    public Integer findLastInsertId() throws SQLException {
        String sql = "SELECT LAST_INSERT_ID()" ;
        super.pstmt = super.conn.prepareStatement(sql) ;
        ResultSet rs = super.pstmt.executeQuery() ;
        if (rs.next()) {
            return rs.getInt(1) ;
        }
        return 0 ;
    }

    @Override
    public boolean doCreatOrders(Orders vo) throws SQLException {
        String sql = "INSERT INTO orders(mid,name,phone,address,credate,pay) VALUES(?,?,?,?,?,?)" ;
        super.pstmt = super.conn.prepareStatement(sql) ;
        super.pstmt.setString(1,vo.getMember().getMid());
        super.pstmt.setString(2,vo.getName());
        super.pstmt.setString(3,vo.getPhone());
        super.pstmt.setString(4,vo.getAddress());
        super.pstmt.setTimestamp(5,new java.sql.Timestamp(vo.getCredate().getTime()));
        super.pstmt.setDouble(6,vo.getPay());
        return super.pstmt.executeUpdate() > 0;
    }

    @Override
    public List<Orders> findAllByMember(String mid, Integer currentPage, Integer lineSize) throws Exception {
        List<Orders> all = new ArrayList<Orders>() ;
        String sql = "SELECT oid,mid,name,phone,address,credate,pay FROM orders WHERE mid=? LIMIT ? OFFSET ?" ;
        super.pstmt = super.conn.prepareStatement(sql) ;
        super.pstmt.setString(1,mid);
        super.pstmt.setInt(2,lineSize);
        super.pstmt.setInt(3,(currentPage - 1) * lineSize);
        ResultSet rs = super.pstmt.executeQuery() ;
        while (rs.next()) {
            Orders o = new Orders() ;
            o.setOid(rs.getInt(1));
            Member m = new Member() ;
            m.setMid(rs.getString(2));
            o.setMember(m);
            o.setName(rs.getString(3));
            o.setPhone(rs.getString(4));
            o.setAddress(rs.getString(5));
            o.setCredate(rs.getTimestamp(6));
            o.setPay(rs.getDouble(7));
            all.add(o) ;
        }
        return all ;
    }

    @Override
    public Integer getAllCountByMember(String mid) throws Exception {
        String sql = "SELECT COUNT(*) FROM orders WHERE mid=?" ;
        super.pstmt = super.conn.prepareStatement(sql) ;
        super.pstmt.setString(1,mid);
        ResultSet rs = super.pstmt.executeQuery() ;
        if (rs.next()) {
            return rs.getInt(1) ;
        }
        return 0;
    }

    @Override
    public Orders findByIdAndMember(String mid, Integer oid) throws Exception {
        Orders vo = null ;
        List<Orders> all = new ArrayList<Orders>() ;
        String sql = "SELECT oid,mid,name,phone,address,credate,pay FROM orders WHERE mid=? AND oid=?" ;
        super.pstmt = super.conn.prepareStatement(sql) ;
        super.pstmt.setString(1,mid);
        super.pstmt.setInt(2,oid);
        ResultSet rs = super.pstmt.executeQuery() ;
        if (rs.next()) {
            vo = new Orders() ;
            vo.setOid(rs.getInt(1));
            Member m = new Member() ;
            m.setMid(rs.getString(2));
            vo.setMember(m);
            vo.setName(rs.getString(3));
            vo.setPhone(rs.getString(4));
            vo.setAddress(rs.getString(5));
            vo.setCredate(rs.getTimestamp(6));
            vo.setPay(rs.getDouble(7));
        }
        return vo ;
    }

    @Override
    public boolean doCreate(Orders vo) throws Exception {
        return false;
    }

    @Override
    public boolean doUpdate(Orders vo) throws Exception {
        return false;
    }

    @Override
    public boolean doRemoveBatch(Set<Integer> ids) throws Exception {
        return false;
    }

    @Override
    public Orders findById(Integer id) throws Exception {
        Orders vo = null ;
        List<Orders> all = new ArrayList<Orders>() ;
        String sql = "SELECT oid,mid,name,phone,address,credate,pay FROM orders WHERE oid=?" ;
        super.pstmt = super.conn.prepareStatement(sql) ;
        super.pstmt.setInt(1,id);
        ResultSet rs = super.pstmt.executeQuery() ;
        if (rs.next()) {
            vo = new Orders() ;
            vo.setOid(rs.getInt(1));
            Member m = new Member() ;
            m.setMid(rs.getString(2));
            vo.setMember(m);
            vo.setName(rs.getString(3));
            vo.setPhone(rs.getString(4));
            vo.setAddress(rs.getString(5));
            vo.setCredate(rs.getTimestamp(6));
            vo.setPay(rs.getDouble(7));
        }
        return vo ;
    }

    @Override
    public List<Orders> findAll() throws Exception {
        return null;
    }

    @Override
    public List<Orders> findAllSplit(Integer currentPage, Integer lineSize, String column, String keyWord) throws Exception {
        List<Orders> all = new ArrayList<Orders>() ;
        String sql = "SELECT oid,mid,name,phone,address,credate,pay FROM orders WHERE " + column + " LIKE ? LIMIT ? OFFSET ?" ;
        super.pstmt = super.conn.prepareStatement(sql) ;
        super.pstmt.setString(1,"%"+ keyWord + "%");
        super.pstmt.setInt(2,lineSize);
        super.pstmt.setInt(3,(currentPage - 1) * lineSize);
        ResultSet rs = super.pstmt.executeQuery() ;
        while (rs.next()) {
            Orders o = new Orders() ;
            o.setOid(rs.getInt(1));
            Member m = new Member() ;
            m.setMid(rs.getString(2));
            o.setMember(m);
            o.setName(rs.getString(3));
            o.setPhone(rs.getString(4));
            o.setAddress(rs.getString(5));
            o.setCredate(rs.getTimestamp(6));
            o.setPay(rs.getDouble(7));
            all.add(o) ;
        }
        return all ;
    }

    @Override
    public Integer getAllCount(String column, String keyWord) throws Exception {
        String sql = "SELECT COUNT(*) FROM orders WHERE " + column + " LIKE ? " ;
        super.pstmt = super.conn.prepareStatement(sql) ;
        super.pstmt.setString(1,"%" + keyWord + "%");
        ResultSet rs = super.pstmt.executeQuery() ;
        if (rs.next()) {
            return rs.getInt(1) ;
        }
        return 0;
    }
}
