package dao;

import java.sql.*;

public class DBManager {
  private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
  private final String DB_URL = "jdbc:mysql://localhost:3306/team5?&useSSL=false&serverTimezone=UTC";

  private final String USER_NAME = "root"; // ���� ��ǻ�� MySQL �����̸�
  private final String PASSWORD = "root"; // ���� ��ǻ�� MySQL ��й�ȣ

  Connection conn;
  Statement stmt;
  ResultSet rs;

  // DBManager ��ü ������ ��, �����ͺ��̽��� �����
  public DBManager() {
    try {
      Class.forName(JDBC_DRIVER);
      this.conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
      this.stmt = this.conn.createStatement();
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
    }
  }

  // INSERT, DELETE, UPDATE ���� ����
  void update(String sql) {
    try {
      this.stmt.executeUpdate(sql);
    } catch (SQLException e) {
      System.out.println("update error:"+e);
    }
  }

  // SELECT �� ����
  void select(String sql) {
    try {
      this.rs = this.stmt.executeQuery(sql);
    } catch (SQLException e) {
      System.out.println("select error:" + e);
    }
  }

  // �������� �׻� ���� �����ֱ�
  void close() {
    try {
      conn.close();
    }catch (Exception e) {
      System.out.println("close error"+e);
    }
  }
}
