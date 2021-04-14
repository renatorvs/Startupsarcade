         <a href="/blog/create"class="btn btn-primary btn-sm">ir para o  blog</a>
       </section>
       {% if haBlogCategoria  %}
       <h4 align="left"> <strong>Categoria artigo:</strong> <span class=text-primary>{{categoria_nome}}</span></h4><br>
       <hr>
       {% for postBlogDestaques in  postBlogDestaque %}
       <section class="jumbotron p-3 p-md-5 text-white rounded bg-dark">

        <section class="col-md-6 px-0">
         <strong class="d-inline-block mb-2 text-white">{{postBlogDestaques.blogcat_nome}}</strong>
         <h1 class="display-4 font-italic">{{postBlogDestaques.post_titulo}}</h1>
         <p class="lead my-3">{{postBlogDestaques.post_subtitulo}}</p>
         <p class="lead mb-0">   <a href="/blog/show/{{postBlogDestaques.post_id}}" class="text-white
          font-weight-bold">Continue lendo...</a></p>
        </section>
      </section>
      {% endfor %}
      {% else  %}
      <article class="card" id="card-nao-ha-categoria">
        <section class="card-body">
categoria_artigo = "Categoria artigo";
         <h4 align="left"> <strong>Categoria artigo:</strong> <span class=text-primary>{{categoria_nome}}</span></h4><br>
         <h6 align="left">  <span class=text-danger>Não_ha_artigo com essa categoria ainda.</span></h6>
       </section>Nao_ha_artigo =  "Não_ha_artigo com essa categoria ainda";
     </article>
     {% endif  %}
     <section class="row mb-2">
      {% for post in  blogCategoria %}
      <section class="col-md-6">
        <article class="card flex-md-row mb-4 box-shadow h-md-250">
          <section class="card-body d-flex flex-column align-items-start">
            {% if admin_session  %}
            <strong class=text-dark>Local post: {{post.blogdest_nome}} </strong>
            {% endif %}
            <strong class="d-inline-block mb-2 text-dark">{{post.blogcat_nome}}</strong>
            <h3 class="mb-0">
              <a class="text-dark" href="#">{{post.post_titulo}}</a>
            </h3>
            <section class="mb-1 text-muted">{{post.blog_date | date("m/d/y")}}</section>
            <p class="card-text mb-auto">{{post.post_subtitulo}}.</p>
            <a href="/blog/show/{{post.post_id}} " class="btn btn-outline-secondary btn-sm">Continue_lendo</a>
          </section>
        </article>
      </section>
      {% endfor %}
    </section>

  </main


  Continue_lendo = "Continue_lendo";