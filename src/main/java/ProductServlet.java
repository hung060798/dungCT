import product.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {""})
public class ProductServlet extends HttpServlet {
    ArrayList<Product> list = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        list.add(new Product(1, "Xe 1", "img/anh1.jpeg", 50000));
        list.add(new Product(2, "Xe 2", "img/anh2.jpeg", 50000));
        list.add(new Product(3, "Xe 3", "img/anh3.jpeg", 50000));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        RequestDispatcher requestDispatcher;
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                resp.sendRedirect("CreateProduct.jsp");
                break;
            case "delete":
                int indexDelete = Integer.parseInt(req.getParameter("index"));
                list.remove(indexDelete);
                resp.sendRedirect("/");
                break;
            case "edit":
                int indexEdit = Integer.parseInt(req.getParameter("index"));
                Product product = list.get(indexEdit);
                req.setAttribute("product", product);
                requestDispatcher = req.getRequestDispatcher("EditProduct.jsp");
                requestDispatcher.forward(req, resp);
                break;
            default:
                req.setAttribute("listProduct", list);
                requestDispatcher = req.getRequestDispatcher("home.jsp");
                requestDispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String index = req.getParameter("index");
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String img = req.getParameter("img");
        int price = Integer.parseInt(req.getParameter("price"));
        if(index == null) {
            list.add(new Product(id, name, img, price));
        } else {
            list.set(Integer.parseInt(index), new Product(id, name, img, price));
        }
            resp.sendRedirect("/");

    }
}

