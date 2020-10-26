package controller;

import dao.DiffImageDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String uri = req.getRequestURI();
    String cmd = uri.substring(uri.lastIndexOf("/") + 1);
    System.out.println("�깉濡쒓퀬移�!!");
    if (cmd.equals("start.do")) {
      DiffImageDAO.getInstance().setRandomIndex(req.getParameter("difficult"));
      req.getServletContext().getRequestDispatcher("/main.do").forward(req, resp);
    } else if (cmd.equals("main.do")) {

      FDIController fdiController = new FDIController();
      fdiController.startFDI(req, resp);
    }
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    service(req, resp);
  }

}
