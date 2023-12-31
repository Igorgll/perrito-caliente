<%@ page contentType="text/html; charset=UTF-8" %> <%@ page
import="br.com.perritoCaliente.model.Usuario" %> <%@ page
import="javax.servlet.http.HttpSession" %> <%@ page
import="br.com.perritoCaliente.model.Receita" %> <%@ page
import="java.util.List" %> <%@ page import="java.util.ArrayList" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Página inicial</title>
    <link
      rel="icon"
      href="./styles/assets/favicon-32x32.png"
      type="image/x-icon"
    />
    <link rel="stylesheet" href="./styles/global.css" />
    <link rel="stylesheet" href="./styles/navbar.css" />
    <link rel="stylesheet" href="./styles/footer.css" />
    <link rel="stylesheet" href="./styles/banner.css" />
    <link rel="stylesheet" href="./styles/indexContent.css" />
    <link rel="stylesheet" href="./styles/recipes.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="wrapper">
      <nav>
        <a href="index.jsp">
          <div class="logo">
            <a href="./index.jsp">
              <img src="./styles/assets/finalfinakl 4.png" alt="Logo" />
            </a>
          </div>
        </a>
        <ul class="nav-list" style="margin-bottom: 0">
          <a href="/find-all-recipes" style="text-decoration: none; color: inherit"
            ><li>Receitas</li></a
          >
          <li>Sobre nós</li>
          <li>Contato</li>
        </ul>
        <div class="nav-buttons">
          <!-- Verificação de usuário na sessão -->
          <% HttpSession currentSession = request.getSession(false); Usuario
          usuarioLogado = (currentSession != null) ? (Usuario)
          currentSession.getAttribute("usuarioLogado") : null; if (usuarioLogado
          == null) { %>
          <!-- usuário não logado - exibe botões de cadastro e entrar -->
          <a href="./signup.jsp" style="text-decoration: none; color: inherit"
            ><button class="login-btn">Cadastre-se</button></a
          >
          <a href="./login.jsp" style="text-decoration: none; color: inherit"
            ><button class="signup-btn">Entrar</button></a
          >
          <% } else { %>
          <!-- usuário logado -->
          <div
            class="logged-nav"
            style="
              display: flex;
              flex-direction: row;
              align-items: center;
              justify-content: center;
              border: 0;
              display: flex;
              flex-direction: row;
              justify-content: space-between;
              align-items: center;
              gap: 20px;
            "
          >
            <a
              href="/user-dashboard"
              style="text-decoration: none; color: inherit"
            >
              <span style="color: #000"
                >Bem-vindo, <%= usuarioLogado.getNome() %></span
              >
            </a>
            <div
              style="
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: center;
              "
            >
              <button
                class="login-btn"
                id="openModalBtn"
                data-bs-toggle="modal"
                data-bs-target="#exampleModal"
              >
                Adicionar receita
              </button>
            </div>
            <div>
              <form action="logout" method="post">
                <button
                  class="login-btn"
                  style="
                    width: 150px;
                    height: 46px;
                    font-size: 18px;
                    border-radius: 6px;
                    border: none;
                    background: var(--orange);
                    color: var(--light);
                    cursor: pointer;
                    margin: 0;
                  "
                >
                  Sair
                </button>
              </form>
            </div>
          </div>
          <% } %>
        </div>
      </nav>
      <div class="banner" style="height: 450px">
        <h1>Confira todas receitas</h1>
        <div class="categories__searchBar">
          <div class="search-input_wrapper" style="margin: auto; width: 705px; margin-top: 20px;">
            <input
              type="text"
              name=""
              id=""
              placeholder="Pesquise uma receita ou igrediente"
            />
            <button id="search__button" style="height: 45px; width: 140px">
              Pesquisar
            </button>
          </div>
        </div>
      </div>
      <div class="index__content" style="padding: 20px 70px">
        <h2 style="font-size: 38px; margin-top: 10px;">Receitas</h2>
        <div class="all__recipes" style="margin-top: 30px;">
          <ul
            style="
              display: grid;
              grid-template-columns: 1fr 1fr 1fr 1fr;
              gap: 20px;
              list-style: none;
              padding: 20px 0 40px 0;
            "
          >
            <c:forEach var="receita" items="${receitas}">
              <a style="text-decoration: none; color: inherit;" href="recipe-description?idReceita=${receita.idReceita}">
              <li class="recipe__card">
                <div class="card__background">
                  <div class="card__profile">
                    <div class="card__profile-pic">
                      <img
                        id="profile__pic"
                        src="./styles/assets/profile.png"
                        alt="Foto do Ana de Armas"
                      />
                      <span>${receita.usuario.usuario}</span>
                    </div>
                    <div class="card__stars">
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                      <img src="./styles/assets/star.png" alt="Star icon" />
                    </div>
                  </div>
                  <img
                  style="border-top-right-radius: 10px; border-top-left-radius: 10px;"
                  src="${receita.caminhoImagem}"
                  alt="Foto da Receita"
                  />
                </div>
                <div class="card__description">
                  <p>${receita.getNomeReceita()}</p>
                </div>
              </li>
            </a>
            </c:forEach>
          </ul>
        </div>
      </div>
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

      <!-- MODAL -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Adicionar Receita</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form action="/create-recipe" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                  <label for="exampleInput" class="form-label">Nome da Receita</label>
                  <input type="text" name="recipe-name" id="recipe-name" value="${param.name}" class="form-control">
                </div>
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Modo de Preparo</label>
                  <textarea class="form-control" type="text" placeholder="Digite o modo de preparo" name="recipe-preparation" id="recipe-preparation" rows="5" value="${param.name}" class="form-control"></textarea>
                </div>
                <div class="mb-3">
                  <label for="ingredientes" class="form-label">Ingredientes</label>
                  <textarea class="form-control" name="recipe-ingredient" id="recipe-ingredient" value="${param.name}" rows="5" placeholder="Digite os ingredientes, um por linha"></textarea>
                </div>
                <div class="mb-3">
                  <label for="inputGroupFile" class="form-label">Imagem da Receita</label>
                  <input type="file" class="form-control" name="image" id="image" aria-describedby="inputGroupFileAddon" accept="image/*">
                </div>
                <div class="mb-3">
                  <label for="exampleInputPassword1" class="form-label">Link do vídeo da receita</label>
                  <input type="text" name="recipe-video" id="recipe-video" value="${param.name}" class="form-control">
                </div>
                <div class="modal-footer">
                 <button type="submit" class="btn btn-primary">Postar receita</button>
                </div>
              </form>
            </div>

          </div>
        </div>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
