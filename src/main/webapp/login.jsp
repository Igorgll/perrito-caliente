<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Perrito Calliente</title>
    <link rel="icon" href="./styles/assets/favicon-32x32.png" type="image/x-icon">
    <link rel="stylesheet" href="./styles/global.css" />
    <link rel="stylesheet" href="./styles/navbar.css" />
    <link rel="stylesheet" href="./styles/main.css" />
    <link rel="stylesheet" href="./styles/footer.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="content-wrapper">
      <nav>
        <a href="index.jsp">
          <div class="logo">
            <a href="./index.jsp">
              <img src="./styles/assets/finalfinakl 4.png" alt="Logo" />
            </a>
          </div>
        </a>
        <ul class="nav-list" style="margin-bottom: 0;">
          <a href="/find-all-recipes" style="text-decoration: none; color: inherit"
            ><li>Receitas</li></a
          >
          <li>Sobre nós</li>
          <li>Contato</li>
        </ul>
        <div class="nav-buttons">
          <a href="./signup.jsp" style="text-decoration: none; color: inherit"
            ><button class="login-btn">Cadastre-se</button></a
          >
          <a href="./login.jsp" style="text-decoration: none; color: inherit"
            ><button class="signup-btn">Entrar</button></a
          >
        </div>
      </nav>

      <main style="height: 90%">
        <form action="/login" method="post">
          <h2>Entrar</h2>
          <span>Não possui uma conta? <a href="./signup.jsp">Cadastre-se</a></span>

          <label for="usuario">Usuário:</label>
          <input type="text" id="usuario" name="usuario" required />

          <label for="senha">Senha:</label>
          <input type="password" id="senha" name="senha" required />

          <button type="submit">Entrar</button>
        </form>
      </main>
      <footer>
        <div class="logo-footer">
          <img src="./styles/assets/finalfinakl 4.png" alt="Logo" />
        </div>
        <div class="line"></div>
        <span id="copyright">@Copyright. All rights reserved.</span>
        <div class="disclaimer-container">
          <span id="disclaimer">Projeto desenvolvido sem fins lucrativos.</span>
        </div>
      </footer>
    </div>
  </body>
</html>
