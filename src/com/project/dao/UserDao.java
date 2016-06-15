package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.project.bean.UserVo;
import com.project.common.Jdbc;

public class UserDao {
	
	//王  ==========================================================================
	//判断账户是否存在
	public boolean chack(UserVo vo) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		boolean b = false;
		try {
			con = Jdbc.getInstance().getCon();
			String sql = "select username from user where account =? or userID=?";
			pst = con.prepareStatement(sql);
			pst.setString(1, vo.getAccount());
			pst.setString(2, vo.getUserID());
			rs = pst.executeQuery();
			if (rs.next()) {
				b = true;
			} else {
				b = false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}

	//找到用户信息
	public List ListCard(UserVo vo) throws SQLException {
		List noteList = new ArrayList();
		UserVo nv = new UserVo();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = Jdbc.getInstance().getCon();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "select * from user where account=? and password=?";
		pst = con.prepareStatement(sql);
		pst.setString(1, vo.getAccount());
		pst.setString(2, vo.getPassword());
		rs = pst.executeQuery();

		while (rs.next()) {
			nv.setUsername(rs.getString("username"));
			nv.setPassword(rs.getString("password"));
			nv.setMoney(rs.getDouble("money"));
			nv.setReaname(rs.getString("reaname"));
			nv.setUserID(rs.getString("userID"));
			nv.setAccount(rs.getString("account"));
			nv.setCardPassword(rs.getString("cardPassword"));
			nv.setDay(rs.getString("day"));
			nv.setMouth(rs.getString("mouth"));
			nv.setTele(rs.getString("tele"));
			nv.setYear(rs.getString("year"));
			noteList.add(nv);
		}
		Jdbc.getInstance().closeAll(con, pst, rs);
		return noteList;
	}

	//插入到数据库
	public void insert(UserVo vo) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = Jdbc.getInstance().getCon();
			String sql = "insert into user(account,password,username,userID,reaname,cardPassword,tele,year,mouth,day) values(?,?,?,?,?,?,?,?,?,?)";
			pst = con.prepareStatement(sql);
			pst.setString(1, vo.getAccount());
			pst.setString(2, vo.getPassword());
			pst.setString(3, vo.getUsername());
			pst.setString(4, vo.getUserID());
			pst.setString(5, vo.getReaname());
			pst.setString(6, vo.getCardPassword());
			pst.setString(7, vo.getTele());
			pst.setString(8, vo.getYear());
			pst.setString(9, vo.getMouth());
			pst.setString(10, vo.getDay());
			pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Jdbc.getInstance().closeAll(con, pst, rs);
	}

	public void changeInfer(String tele,String year,String month,String day,String account){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			con = Jdbc.getInstance().getCon();
			String sql = "update user set tele =?,year=?,mouth=?,day=? where account = ?";
			pst = con.prepareStatement(sql);
			pst.setString(1, tele);
			pst.setString(2, year);
			pst.setString(3, month);
			pst.setString(4, day);
			pst.setString(5, account);
			pst.executeUpdate();
			System.out.println("ok");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Jdbc.getInstance().closeAll(con, pst, rs);
	}
	
	
	
	// 张  ==============================================================================
	// ----------------------------------------判断卡号金额是否足够转账
	public boolean CanDraw(String myaccount, Double drawmoney) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pst = null;
		double money = 0;
		boolean b = false;
		try {
			con = Jdbc.getInstance().getCon();
			String sql = "select money from user where account=?";
			pst = con.prepareStatement(sql);
			pst.setString(1, myaccount);
			rs = pst.executeQuery();
			if (rs.next()) {
				money = rs.getDouble("money");
				if (money >= drawmoney) {
					b= true;
				}
				else{
					b=false;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Jdbc.getInstance().closeAll(con, pst, rs);
		return b;

	}

	// -----------------------------------------转账到新的卡 更改新卡内信息
	public void transfer(String myaccount,String hisccount, double money) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = Jdbc.getInstance().getCon(); // 创建连接
		//	con.setAutoCommit(false); // 取消自动提交
			String s = "update user set money =money-"+money+" where account = ?";
			pst = con.prepareStatement(s);
			pst.setString(1, myaccount);
			pst.executeUpdate();				
			String ss = "update user set money =+"+money+" where account = ?";
			pst = con.prepareStatement(ss);
			pst.setString(1, hisccount);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Jdbc.getInstance().closeAll(con, pst, rs);
	}
	// -------------------------------------先查看是否有这个卡
	public boolean checkCard(String account) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		boolean b = false;
		try {
			con = Jdbc.getInstance().getCon();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "select account from user where account=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, account);
			rs = pst.executeQuery();
			if (rs.next()) {
				b = true;
			}
			else{
				b=false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Jdbc.getInstance().closeAll(con, pst, rs);
		return b;
	}
	public String getName(String account) {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String b = null;
		try {
			con = Jdbc.getInstance().getCon();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "select reaname from user where account=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, account);
			rs = pst.executeQuery();
			if (rs.next()) {
				b = rs.getString("reaname");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Jdbc.getInstance().closeAll(con, pst, rs);
		return b;
	}
	//宋==========================================================================
	 public  boolean matchPassword(String account,String password) {		 
			Connection con = null;
			PreparedStatement pst=null;
			ResultSet rs=null;
			boolean b=false;
			try {
				con = Jdbc.getInstance().getCon();
				String sql="select username from user where account=? and password=?";
				pst=con.prepareStatement(sql);
				pst.setString(1,account);		
				pst.setString(2,password);		
 			    rs = pst.executeQuery();			
 			if(rs.next()){
 				b=true;
 			}    
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}						
			Jdbc.getInstance().closeAll(con, pst, rs);
			return b;
		}
	 public void change(String account,String password){
		Connection con = null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			con = Jdbc.getInstance().getCon();
			String sql="update user set password = ? where account=?";
			pst=con.prepareStatement(sql);
			pst.setString(1,password);
			pst.setString(2,account);
			pst.executeUpdate();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
}
