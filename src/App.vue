<template>
  <div id="app">

    <nav>
      <div class="nav-wrapper blue darken-1">
        <a href="#" class="brand-logo center">Product Qualifier</a>
      </div>
    </nav>

    <div class="container">

      <form>
          <label>Nome do Produto</label>
          <input type="text" placeholder="Nome do Produto">
          <label>Descrição</label>
          <input type="number" placeholder="Descrição">
          <label>Cod QX</label>
          <input type="text" placeholder="Codigo QX">
          <label>Qualidade</label>
          <input type="number" placeholder="QLD">
          <label>Slug</label>
          <input type="text" placeholder="Slug">

          <button class="waves-effect waves-light btn-small">Salvar<i class="material-icons left">save</i></button>

      </form>

      <table>

        <thead>

          <tr>
            <th>Produto</th>
            <th>Descrição</th>
            <th>Codigo QX</th>
            <th>QLD</th>            
            <th>OPÇÕES</th>
          </tr>

        </thead>
        <tbody>
          <tr>

            <td>Arduino</td>
            <td>hardware livre</td>
            <td>#0000FF</td>
            <td>1</td>
            
            <td>
              <button class="waves-effect btn-small blue darken-1"><i class="material-icons">create</i></button>
              <button class="waves-effect btn-small red darken-1"><i class="material-icons">delete_sweep</i></button>
            </td>

          </tr>
        </tbody>      
      </table>
    </div>

  </div>
</template>

<script>
import Qualifiers from './services/qualifier'

export default {
  mounted(){    
    Qualifier.list().then(resp => {
      console.log(resp.data)
    })
  }
}


// const axios = require('axios');
// // Make a request for a user with a given ID
// axios.get('http://127.0.0.1:8000/api/v1')
//   .then(function (response) {
//     // handle success
//     console.log(response.data);
//   })
//   .catch(function (error) {
//     // handle error
//     console.log(error);
//   })
//   .then(function () {
//     // always executed
//   });


</script>

<style>

</style>
