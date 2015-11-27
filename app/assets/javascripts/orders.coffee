addedPrice = []
$(document).ready ->
  $('#add_btn').click() if not $('#error_explanation').length
  $('#delete-btn-mark').remove()
  $('#delete_btn').remove()
  $('#custom_pizza_fields').hide()
  $(':radio').click ->
    calculateTotal($(this))
  $(':radio').change ->
    if $('.custom_pizza').is(":checked")
      $('#custom_pizza_fields').show()
    else
      uncheckBoxes($('#custom_pizza_fields'))
      $('#custom_pizza_fields').hide()
  $(':checkbox').click ->
    customPrice($(this))
  $('.quantity').change ->
    adjustTotal($(this))
  $('.deletion').click ->
    adjustForDeletion($(this))
  $('body').on 'cocoon:after-insert', (e, insertedItem) ->
    $(':radio').click ->
      calculateTotal($(this))
    $(':checkbox').off()
    $(':checkbox').click ->
      customPrice($(this))
    $('.quantity').change ->
      adjustTotal($(this))
    $('.deletion').click ->
      adjustForDeletion($(this))
    $(insertedItem).find('#custom_pizza_fields').hide()
    $(insertedItem).find(':radio').change ->
      pizzaDiv = if $(this).hasClass('custom_pizza') then $(this) else $(this).closest('.nested-fields').find('div:has(.custom_pizza)').find(':radio.custom_pizza')
      if $(pizzaDiv).is(":checked")
        $(pizzaDiv).parent().find('#custom_pizza_fields').show()
      else
        $(pizzaDiv).parent().find('#custom_pizza_fields').hide()
  return

calculateTotal = (arg) ->
  if not $(arg).closest('#custom_pizza_fields').length > 0
    #Custom order
    localLabel = $(arg).siblings("label").text()
    quantity = $(arg).closest('.nested-fields').find('.number_field').val()
    orderTotal = $('#order_total')
    if localLabel != "Custom"
      price = $(arg).parent().find('label').text().split(": ")[1].replace('$', '')
    else
      price = 10.99
    price = (parseFloat(price) * parseFloat(quantity)).toFixed(2)
    #Subtract previous price if one exists
    arrayIndex = $('.nested-fields').index($(arg).closest('.nested-fields'))
    if addedPrice[arrayIndex] == undefined
      $(orderTotal).val((parseFloat($(orderTotal).val()) + parseFloat(price)).toFixed(2))
    else
      $(orderTotal).val((parseFloat($(orderTotal).val()) + parseFloat(price) - addedPrice[arrayIndex]).toFixed(2))
    addedPrice[arrayIndex] = parseFloat(price)
  return

adjustTotal = (arg) ->
  arrayIndex = $('.nested-fields').index($(arg).closest('.nested-fields'))
  orderTotal = $('#order_total')
  radio = $(arg).closest('.nested-fields').find(':radio:checked')
  localLabel = $(radio).siblings("label").text()
  if radio.length != undefined and radio.length > 0
    if localLabel.indexOf("Custom") != 0
      price = $(radio).parent().find('label').text().split(": ")[1].replace('$', '')
    else
      price = 10.99
      price += parseFloat(calculateCheckBoxes($(radio)))
  if addedPrice[arrayIndex] != undefined
    $(orderTotal).val((parseFloat($(orderTotal).val()) - addedPrice[arrayIndex]).toFixed(2))
    price = parseFloat(price) * parseFloat($(arg).val())
    $(orderTotal).val((parseFloat($(orderTotal).val()) + price).toFixed(2))
    addedPrice[arrayIndex] = price
  return

adjustForDeletion = (arg) ->
  arrayIndex = $('.nested-fields').index($(arg).closest('.nested-fields'))
  orderTotal = $('#order_total')
  if addedPrice[arrayIndex] != undefined
    $(orderTotal).val((parseFloat($(orderTotal).val()) - addedPrice[arrayIndex]).toFixed(2))
    addedPrice[arrayIndex] = undefined
  return

customPrice = (arg) ->
  label = $(arg).siblings('label')
  toppingPrice = $(label).text().split(": ")[1].replace('$', '')
  arrayIndex = $('.nested-fields').index($(arg).closest('.nested-fields'))
  orderTotal = $('#order_total')
  quantity = $(arg).closest('.nested-fields').find('.number_field').val()
  if addedPrice[arrayIndex] != undefined
    if $(arg).is(':checked')
      $(orderTotal).val(parseFloat($(orderTotal).val()) + (parseFloat(toppingPrice) * parseFloat(quantity)))
      addedPrice[arrayIndex] += (parseFloat(toppingPrice) * parseFloat(quantity))
    else
      $(orderTotal).val(parseFloat($(orderTotal).val()) - (parseFloat(toppingPrice) * parseFloat(quantity)))
      addedPrice[arrayIndex] -= (parseFloat(toppingPrice) * parseFloat(quantity))
  return

uncheckBoxes = (arg) ->
  $(arg).find(':radio:checked').prop('checked', false)
  $(arg).find(':checkbox:checked').prop('checked', false)
  return

calculateCheckBoxes = (arg) ->
  boxes = $(arg).closest('#custom_pizza_fields').find(':checkbox:checked')
  total = 0
  $(boxes).each ->
    label = $(this).siblings('label')
    toppingPrice = $(label).text().split(": ")[1].replace('$', '')
    total += parseFloat(toppingPrice)
  return total
