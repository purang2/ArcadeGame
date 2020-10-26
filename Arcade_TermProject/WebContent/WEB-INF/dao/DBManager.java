package dao;

import java.sql.*;

public class DBManager {
  private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
  private final String DB_URL = "jdbc:mysql://localhost:3306/team5?&useSSL=false&serverTimezone=UTC";

  private final String USER_NAME = "root"; // 본인 컴퓨터 MySQL 유저이름
  private final String PASSWORD = "root"; // 본인 컴퓨터 MySQL 비밀번호

  Connection conn;
  Statement stmt;
  ResultSet rs;

  // DBManager 객체 생성할 때, 데이터베이스와 연결됨
  public DBManager() {
    try {
      Class.forName(JDBC_DRIVER);
      this.conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
      this.stmt = this.conn.createStatement();
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
    }
  }

  // INSERT, DELETE, UPDATE 구문 사용시
  void update(String sql) {
    try {
      this.stmt.executeUpdate(sql);
    } catch (SQLException e) {
      System.out.println("update error:"+e);
    }
  }

  // SELECT 문 사용시
  void select(String sql) {
    try {
      this.rs = this.stmt.executeQuery(sql);
    } catch (SQLException e) {
      System.out.println("select error:" + e);
    }
  }

  // 마지막에 항상 연결 끊어주기
  void close() {
    try {
      conn.close();
    }catch (Exception e) {
      System.out.println("close error"+e);
    }
  }
}
