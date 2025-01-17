<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

    <% 
    String url = "jdbc:mariadb://localhost:3306/equipements";
    String user = "mysql";
    String password = "mysql";

//C'est le POI de l'utilisateur
out.println("lat"+\t+"lon"+\t+"title"+\t+"description"+\t+"icon"+\t+"iconSize"+\t+"iconOffset"+n);
out.println("48.858205"+\t+"2.294359"+\t+"Moi"+\t+"Ma Position"+\t+"Ol_icon_red_example.png"+\t+"24,24"+\t+"0,-24"+\n);


        // Charger le pilote JDBC
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
Connection conn = DriverManager.getConnection(url, user, password);
            // Exemple de requête SQL
        String sql = "SELECT equi_id, equi_libelle, equi_lat, equi_long, get_distance_metres('48.858205', '2.294359', equi_lat, equi_long) AS proximite FROM equipement HAVING proximite < 1000 ORDER BY proximite ASC LIMIT 10;";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        // Afficher les résultats (à adapter selon vos besoins)
        while (rs.next()) {
            String colonne1 = rs.getString("equi_lat");
            String colonne2 = rs.getString("equi_long");
            out.println(colonne1 + "\\t" + colonne2 + "\\tMoi\\tMa Position\\tOl_icon_red_example.png\\t24,24\\t0,-24\\n");
        }

        // Fermer les ressources 
        rs.close();
        pstmt.close();
        conn.close();
    %>
