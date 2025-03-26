<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.User,JDBC.USERjdbc"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Management</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #121212;
    color: #f5f5f5;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

h1 {
    color: #4caf50;
    text-align: center;
    margin: 10px 20px;
    font-size: 36px;
    text-transform: uppercase;
    letter-spacing: 2px;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
    border-bottom: 2px solid #4caf50;
    display: inline-block;
    padding: 10px 20px;
    background-color: #ffffff;
    color: #333;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.table-container {
    width: 85%;
    margin: 30px auto;
    background-color: #ffffff;
    border-radius: 10px;
    overflow: hidden;
    padding: 20px;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 14px 20px;
    text-align: left;
    border-bottom: 1px solid #ddd;
    font-size: 16px;
}

th {
    background-color: #4caf50;
    color: #fff;
    text-transform: uppercase;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:nth-child(odd) {
    background-color: #ffffff;
}

tr:hover {
    background-color: #e0f7fa;
    cursor: pointer;
}

td {
    color: #333;
}

button {
    background: none;
    border: none;
    cursor: pointer;
    padding: 0;
    margin: 0 5px;
    transition: transform 0.2s ease-in-out;
}

button img {
    width: 24px;
    height: 24px;
    filter: brightness(0.8);
}

button:hover img {
    filter: brightness(1.2);
    transform: scale(1.1);
}

.not-found {
    text-align: center;
    margin-top: 50px;
}

.not-found h1 {
    color: #f44336;
    font-size: 24px;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
}

.btn {
    display: block;
    max-width: 200px;
    margin: 0px auto;
    padding: 12px;
    background-color: #00bcd4;
    color: white;
    text-align: center;
    text-decoration: none;
    border-radius: 25px;
    font-size: 18px;
    font-weight: bold;
    transition: all 0.3s ease-in-out;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
}

.btn:hover {
    background-color: #0097a7;
    transform: translateY(-3px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.5);
}

@media (max-width: 768px) {
    body {
        padding: 10px;
    }

    h1 {
        font-size: 28px;
        margin: 10px;
    }

    .table-container {
        width: 100%;
        margin: 20px 0;
        padding: 10px;
    }

    table {
        font-size: 14px;
        display: block;
        overflow-x: auto;
        white-space: nowrap;
    }

    th, td {
        padding: 10px;
    }

    .btn {
        width: 80%;
        font-size: 16px;
    }
}

@media (max-width: 480px) {
    h1 {
        font-size: 24px;
    }

    .btn {
        width: 100%;
    }
}
</style>
</head>
<body>

<h1>User Management</h1>

<%! USERjdbc ob = new USERjdbc(); %>
<%
List<User> users = ob.showUser();
%>

<div class="table-container">
    <%
    if (users.size() > 0) {
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Password</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>
        <%
        for (User user : users) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getMobile() %></td>
            <td><%= user.getPassword() %></td>
            <td><%= user.getRole() %></td>
            <td>
                <form action="./deleteUser" method="post" style="display: inline;">
                    <input type="hidden" name="id" value="<%= user.getId() %>">
                    <button type="submit" title="Delete">
                        <img src="delete.png" alt="Delete">
                    </button>
                </form>
                <form action="./updateUser" method="post" style="display: inline;">
                    <input type="hidden" name="id" value="<%= user.getId() %>">
                    <button type="submit" title="Update">
                        <img src="edit.png" alt="Update">
                    </button>
                </form>
            </td>
        </tr>
        <%
        }
        %>
    </table>
    <%
    } else {
    %>
    <div class="not-found">
        <h1>No Users Found</h1>
    </div>
    <%
    }
    %>

    <div style="text-align: center; margin-top: 30px;">
        <a href="home.jsp" class="btn">Back to Home</a>
    </div>
</div>

</body>
</html>
