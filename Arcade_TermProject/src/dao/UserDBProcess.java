package dao;
import java.sql.SQLException;
import java.sql.*;

// 사용자 정보 DB의 처리를 위한 java
public class UserDBProcess {
	
	// login을 위한 아이디와 비밀번호 일치 여부 확인 함수
	static public boolean loginProcess(String id, String pw)
	{
		DBManager dbManager = new DBManager();
		String  query = "SELECT * from gameUserDB where gameId= '" + id + "' and password = '" + pw + "';";

		dbManager.select(query);		
 		try {
			return dbManager.rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
 			dbManager.close();
		}
		return false;
	}
	
	// 회원가입을 위한 아이디 중복 확인 함수
	static public boolean idCheck(String id)
	{
		DBManager dbManager = new DBManager();
		String query = "SELECT * from gameUserDB where gameId= '" + id + "';";

		dbManager.select(query);		
 		try {
			return dbManager.rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
 			dbManager.close();
		}
		return true;		
	}
	
	// 회원가입을 위한 사용자 정보 DB로 저장을 위한 함수
	static public void signupProcess(String id, String pw, String name, String birth, String nation)
	{
		DBManager dbManager = new DBManager();
		String query = "INSERT INTO gameUserDB VALUES('" + id + "', '" + pw + "', '" + name + "', '" + birth + "', '" + nation + "');";

		dbManager.update(query);		
	}
	
}
