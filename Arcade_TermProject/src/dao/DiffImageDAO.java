package dao;

import dto.DiffImage;
import entity.Axis;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

public class DiffImageDAO {
  public static DiffImageDAO instance = new DiffImageDAO();

  public static DiffImageDAO getInstance() {
    return instance;
  }

  private ArrayList<Integer> indexes;
  /*
   * 선택한 난이도에 해당하는 랜덤한 이미지를 넘겨준다.
   */
  public DiffImage getRandomImage(int round) {
    DiffImage image = new DiffImage();
    int randomIndex = indexes.get(round);
    String sql = "SELECT x, y, size FROM FDI_image_diff_axis WHERE image_number = " + randomIndex;
    DBManager dbManager = new DBManager();
    dbManager.select(sql);
    image.setImageNumber(randomIndex);
    image.setImageName(Integer.toString(randomIndex));
    try {
      ArrayList<Axis> axes = new ArrayList<>();
      while(dbManager.rs.next()) {
        axes.add(new Axis(dbManager.rs.getInt(1), dbManager.rs.getInt(2), dbManager.rs.getInt(3)));
      }
      image.setAxis(axes);
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbManager.close();
    }
    return image;
  }

  public void setRandomIndex(String difficult) {
    DBManager dbManager = new DBManager();
    Random r = new Random();
    dbManager.select("SELECT image_number FROM FDI_image WHERE difficult = '" + difficult + "'");
    indexes = new ArrayList<>();
    try {
      while (dbManager.rs.next())
        indexes.add(dbManager.rs.getInt(1));
    } catch (SQLException e) {
      System.out.println("error getTotalCount:" + e);
    } finally {
      dbManager.close();
    }
    Collections.shuffle(indexes); // 랜덤으로 순서를 섞는다.
    System.out.println(indexes);
  }
}
