$(function(){
  function buildHTML(comment){
    var html =` <p>
            <strong><a>${user.nickname}</a>
            </strong>
            <% num = 0 %>
            <% while ${comment.rate} > num do %>
            <a class="fa fa-ghost"></a>
            <% num += 1 %>
            <% end %>
            <a class="text">
            <br>
            ${@comment.text}>
            </a>
          </p>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log(this)
      var html = buildHTML(data);
      $('.comments').append(html)
      $('.textbox').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
})
