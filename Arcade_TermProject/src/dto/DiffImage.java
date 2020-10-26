package dto;

import entity.Axis;
import java.util.ArrayList;

public class DiffImage {
  int imageNumber;
  String imageName;
  ArrayList<Axis> axis;

  public ArrayList<Axis> getAxis() {
    return axis;
  }

  public void setAxis(ArrayList<Axis> axis) {
    this.axis = axis;
  }

  public void setImageNumber(int imageNumber) {
    this.imageNumber = imageNumber;
  }

  public String getImageName() {
    return imageName;
  }

  public void setImageName(String imageName) {
    this.imageName = imageName;
  }
}
