package controller;

import dao.DiffImageDAO;
import dto.DiffImage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FDIController {

  public void startFDI(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String difficult = request.getParameter("difficult");
    response.setCharacterEncoding("UTF-8");
    DiffImageDAO diffImageDAO = DiffImageDAO.getInstance();
    System.out.println("test = " + this.getRound(request));
    DiffImage image = diffImageDAO.getRandomImage(this.getRound(request) - 1);
    request.setAttribute("imageName", image.getImageName());
    request.setAttribute("difficult", difficult);
    request.setAttribute("imageAxis", image.getAxis());
    request.setAttribute("round", this.getRound(request));
    request.getRequestDispatcher("02_FDI/FDIGame.jsp").forward(request, response);
  }

  public int getRound(HttpServletRequest request) {
    Object str = request.getParameter("round");
    int round = 1;
    if (str == null)
      return round;
    return Integer.parseInt(str.toString()) + 1;
  }
}
