package dao;
import java.sql.SQLException;
import java.sql.*;

// ����� ���� DB�� ó���� ���� java
public class UserDBProcess {
	
	// login�� ���� ���̵�� ��й�ȣ ��ġ ���� Ȯ�� �Լ�
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
	
	// ȸ�������� ���� ���̵� �ߺ� Ȯ�� �Լ�
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
	
	// ȸ�������� ���� ����� ���� DB�� ������ ���� �Լ�
	static public void signupProcess(String id, String pw, String name, String birth, String nation)
	{
		DBManager dbManager = new DBManager();
		String query = "INSERT INTO gameUserDB VALUES('" + id + "', '" + pw + "', '" + name + "', '" + birth + "', '" + nation + "');";

		dbManager.update(query);		
	}
	
}
