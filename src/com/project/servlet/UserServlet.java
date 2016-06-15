package com.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.project.bean.UserVo;
import com.project.dao.UserDao;

/**
 * Servlet implementation class CreditServlet
 */
/**
 * @author Administrator
 * 
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		UserVo vo2 = new UserVo();
		UserDao dao2 = new UserDao();
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name"); //从注册界面取用户输入的值
		String year = request.getParameter("year");
		String mouth = request.getParameter("mouth");
		String day = request.getParameter("day");
		String tele = request.getParameter("tele");
		String email = request.getParameter("email");
		String account = request.getParameter("account");
		String ID = request.getParameter("ID");
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("password");
		String cardPassword = request.getParameter("cardPassword");
		String hisAccount = request.getParameter("hisAccount");
		String status = request.getParameter("status");
		if ("registe".equals(status)) {	//如果提交过来status是为Registe的						
			if (name != "" && year != "" && mouth != "" && cardPassword != ""	//判断是否所有的空都填满
					&& password != "" && nickname != "" && ID != ""
					&& day != null && tele != "" && email != ""
					&& account != "" && account != "") {
				char te[] = tele.toCharArray(); // 把电话号码转换为字符数组的形式
				int i = te.length; // 取得字符数组的长，即输入的电话号码的长度
				if (Character.isDigit(te[i - 1]) && i == 3 && tele != null) { // 判断电话号码是否全部是数字，不为空并且长度为3
					if (email.endsWith("@qq.com") || email.endsWith("@163.com")
							&& email != null) {		// 判断邮箱是否是以@qq.com和@163.com结尾的
						char accon[] = account.toCharArray(); // 把银行帐号转换为字符数组的形式
						int j = accon.length;		// 取得字符数组的长，即输入的银行帐号的长度
						if (Character.isDigit(accon[j - 1]) && i == 3
								&& account != null) {	//// 判断银行帐号是否全部是数字，不为空并且长度为3
							char id[] = ID.toCharArray();
							int k = id.length;
							if (Character.isDigit(id[k - 1]) && i == 3
									&& ID != null) {
								char cardp[] = cardPassword.toCharArray();
								int n = cardp.length;
								if (Character.isDigit(id[n - 1]) && i == 3
										&& cardPassword != null) {
									if (year != null && mouth != null
											&& day != null) {
										UserVo vo = new UserVo(); // 创建一个Vo用来存放输入的用户信息
										vo.setAccount(account);		//将取得的值放入Vo
										vo.setDay(day);
										vo.setEmail(email);
										vo.setMouth(mouth);
										vo.setPassword(password);
										vo.setReaname(name);
										vo.setTele(tele);
										vo.setUserID(ID);
										vo.setYear(year);
										vo.setUsername(nickname);
										vo.setCardPassword(cardPassword);
										UserDao dao = new UserDao(); 	// 创建一个dao
										dao.insert(vo);		//将Vo中的信息插入到数据库
										out.print("8");
									} else {
										out.print("7");	//出生日期没选传入7
									}
								} else {
									out.print("6"); // 密码错误向ajax传入6
								}
							} else {
								out.print("5");//身份证号码格式错误向ajax传入5
							}
						} else {
							out.print("4");	//帐号格式错误向ajax传入4
						}
					} else {
						out.print("3");	//邮箱格式错误向ajax传入3
					}
				} else {
					out.print("2");		//电话号码格式错误向ajax传入2
				}
			} else {
				out.print("1"); 	//有空没填满想ajax传入1
			}
		}
		
		
		if ("draw".equals(status)) { // 判断是否是从转账页面发出
			if (dao2.checkCard(hisAccount)) {	//判断对方帐号是否存在
				String money = request.getParameter("zmoney");	//要转给对方的钱数
				String myacc = request.getParameter("zmyacc");	//自己的帐号
				Double mon = Double.parseDouble(money);		//把String变为double
				if (dao2.CanDraw(myacc, mon)) {		//判断我的帐号中的钱是否足够转出
					dao2.transfer(myacc, hisAccount, mon);	//进行转账
					out.print("0");		//转账成功后向ajax传入0
				} else {
					out.print("2");		//钱不够转的情况
				}
			} else {
				out.print("1");		//对方帐号不存在的情况
			}
		}
		
		if ("change".equals(status)){		//判断是否是从修改密码发出的
			String myacc = request.getParameter("zmyacc");		//取得我的帐号
			String oldpass = request.getParameter("oldpass");	//取输入的密码
			String newpass1 = request.getParameter("newpass1");	//两次要修改的密码
			String newpass2 = request.getParameter("newpass2");			
			if(dao2.matchPassword(myacc,oldpass)){		//判断我的帐号和密码是否匹配
				if(newpass1.equals(newpass2)){		//判断两次密码是否一样
					dao2.change(myacc, newpass1);	//修改密码
					out.print("2");		//成功输入2
				}
				else{
					out.print("1");		//两次密码不一样输出1
				}
			}
			else{
				out.print("0");		//转账时输入的我的密码错误
			}
		}
		
		//修改个人信息
		if ("change_infer".equals(status)){
			String myacc = request.getParameter("zmyacc");		//取得我的帐号
			String year2 = request.getParameter("year");
			String month = request.getParameter("month");
			String day2 = request.getParameter("day");
			String newtele = request.getParameter("newtele");
			char newte[] = newtele.toCharArray(); // 把电话号码转换为字符数组的形式
			int i = newte.length; // 取得字符数组的长，即输入的电话号码的长度
			if (Character.isDigit(newte[i-1]) && i == 3 && newtele != null) {
				if (year2!=null && month != null && day2!=null) {
					dao2.changeInfer(newtele, year2,month,day2, myacc);
					out.print("2");
				}
				else{
					out.print("1");//出生日期修改错误
				}
			}
			else{
				out.print("0");//电话号码修改错误
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String account = request.getParameter("Credit_count"); // 从登录界面取值
		String password = request.getParameter("Credit_passward");
		HttpSession session = request.getSession();
		UserVo vo = new UserVo();
		UserDao dao = new UserDao();
		vo.setAccount(account); // 把值设置给account
		vo.setUserID(account);	//把值设置给ID
		vo.setPassword(password);
		try {
			if (dao.chack(vo)) {	//判断数据库中是否有这个人或帐号
				List list = (List) dao.ListCard(vo);
				String reaname=dao.getName(account);
				session.setAttribute("reaname", reaname);
				session.setAttribute("list", list);
				
				if (list != null && list.size() > 0) { // 如果从数据库取值成功
					Object obj = list.get(0); // 只取第一个数据
					JSONObject jsb = JSONObject.fromObject(obj); // 把obj转换正json对象
					session.setAttribute("jsb", jsb); // 把JSON设置到session中
					out.print(jsb.toString()); // 向ajax返回JSON
				} else {
					out.print("0");	//密码错误
				}
			} else {
				out.print("1");	//没有这个人的话的话输出1
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
