# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Mercadopago.setPublishableKey $('.temp_information').data('key')

addEvent = (el, eventName, handler) ->
  if el.addEventListener
    el.addEventListener eventName, handler
  else
    el.attachEvent 'on' + eventName, ->
      handler.call el
      return
  return


getBin = ->
  cardSelector = document.querySelector('#cardId')
  if cardSelector and cardSelector[cardSelector.options.selectedIndex].value != '-1'
    return cardSelector[cardSelector.options.selectedIndex].getAttribute('first_six_digits')
  ccNumber = document.querySelector('input[data-checkout="cardNumber"]')
  ccNumber.value.replace(/[ .-]/g, '').slice 0, 6

guessingPaymentMethod = (event) ->
  bin = getBin()
  amount = document.querySelector('#amount').value
  if event.type == 'keyup'
    if bin.length == 6
      Mercadopago.getPaymentMethod { 'bin': bin }, setPaymentMethodInfo
  else
    setTimeout (->
      if bin.length >= 6
        Mercadopago.getPaymentMethod { 'bin': bin }, setPaymentMethodInfo
      return
    ), 100
  return

clearOptions = ->
  bin = getBin()
  if bin.length == 0
    document.querySelector('#issuer').style.display = 'none'
    document.querySelector('#issuer').innerHTML = ''
    selectorInstallments = document.querySelector('#installments')
    fragment = document.createDocumentFragment()
    option = new Option('Elegir...', '-1')
    selectorInstallments.options.length = 0
    fragment.appendChild option
    selectorInstallments.appendChild fragment
    selectorInstallments.setAttribute 'disabled', 'disabled'
  return


setPaymentMethodInfo = (status, response) ->
  if status == 200
    aux = []
    aux.push document.getElementById('visa')
    aux.push document.getElementById('amex')
    aux.push document.getElementById('master')
    i = 0
    while i < aux.length
      aux[i].style.opacity = 0.2
      i++
    document.getElementById(response[0].id).style.opacity = 1
    # do somethings ex: show logo of the payment method
    form = document.querySelector('#pay')
    if document.querySelector('input[name=paymentMethodId]') == null
      paymentMethod = document.createElement('input')
      paymentMethod.setAttribute 'name', 'paymentMethodId'
      paymentMethod.setAttribute 'type', 'hidden'
      paymentMethod.setAttribute 'value', response[0].id
      form.appendChild paymentMethod
    else
      document.querySelector('input[name=paymentMethodId]').value = response[0].id
    # check if the security code (ex: Tarshop) is required
    cardConfiguration = response[0].settings
    bin = getBin()
    amount = document.querySelector('#amount').value
    index = 0
    while index < cardConfiguration.length
      if bin.match(cardConfiguration[index].bin.pattern) != null and cardConfiguration[index].security_code.length == 0

        ###
        # In this case you do not need the Security code. You can hide the input.
        ###

      else

        ###
        # In this case you NEED the Security code. You MUST show the input.
        ###

      index++
    Mercadopago.getInstallments {
      'bin': bin
      'amount': amount
    }, setInstallmentInfo
    # check if the issuer is necessary to pay
    issuerMandatory = false
    additionalInfo = response[0].additional_info_needed
    i = 0
    while i < additionalInfo.length
      if additionalInfo[i] == 'issuer_id'
        issuerMandatory = true
      i++
    Mercadopago.getIssuers response[0].id, showCardIssuers
    addEvent document.querySelector('#issuer'), 'change', setInstallmentsByIssuerId
  return


showCardIssuers = (status, issuers) ->
  issuersSelector = document.querySelector('#issuer')
  fragment = document.createDocumentFragment()
  issuersSelector.options.length = 0
  option = new Option('Elegir...', '-1')
  fragment.appendChild option
  i = 0
  while i < issuers.length
    if issuers[i].name != 'default'
      option = new Option(issuers[i].name, issuers[i].id)
    else
      option = new Option('Otro', issuers[i].id)
    fragment.appendChild option
    i++
  issuersSelector.appendChild fragment
  issuersSelector.removeAttribute 'disabled'
  document.querySelector('#issuer').removeAttribute 'style'
  return


setInstallmentsByIssuerId = (status, response) ->
  issuerId = document.querySelector('#issuer').value
  amount = document.querySelector('#amount').value
  if issuerId == '-1'
    return
  Mercadopago.getInstallments {
    'bin': getBin()
    'amount': amount
    'issuer_id': issuerId
  }, setInstallmentInfo
  return

setInstallmentInfo = (status, response) ->
  selectorInstallments = document.querySelector('#installments')
  fragment = document.createDocumentFragment()
  selectorInstallments.options.length = 0
  if response.length > 0
    option = new Option('Elegir...', '-1')
    payerCosts = response[0].payer_costs
    fragment.appendChild option
    i = 0
    while i < payerCosts.length
      option = new Option(payerCosts[i].recommended_message or payerCosts[i].installments, payerCosts[i].installments)
      fragment.appendChild option
      i++
    selectorInstallments.appendChild fragment
    selectorInstallments.removeAttribute 'disabled'
  return

cardsHandler = ->
  clearOptions()
  cardSelector = document.querySelector('#cardId')
  amount = document.querySelector('#amount').value
  if cardSelector and cardSelector[cardSelector.options.selectedIndex].value != '-1'
    _bin = cardSelector[cardSelector.options.selectedIndex].getAttribute('first_six_digits')
    Mercadopago.getPaymentMethod { 'bin': _bin }, setPaymentMethodInfo
  return

doPay = (event) ->
  event.preventDefault()
  if !doSubmit
    $form = document.querySelector('#pay')
    Mercadopago.createToken $form, sdkResponseHandler
    # The function "sdkResponseHandler" is defined below
    return false
  return

sdkResponseHandler = (status, response) ->
  if status != 200 and status != 201
    alert 'verify filled data'
  else
    form = document.querySelector('#pay')
    card = document.createElement('input')
    card.setAttribute 'name', 'token'
    card.setAttribute 'type', 'hidden'
    card.setAttribute 'value', response.id
    alert 'card token id: ' + response.id
    privateToken = document.createElement('input')
    privateToken.setAttribute 'name', 'privateAccessToken'
    privateToken.setAttribute 'type', 'hidden'
    #            privateToken.setAttribute('value', );
    form.appendChild card
    doSubmit = true
    form.submit()
  return

doSubmit = false
addEvent document.querySelector('#pay'), 'submit', doPay


addEvent document.querySelector('input[data-checkout="cardNumber"]'), 'keyup', guessingPaymentMethod
addEvent document.querySelector('input[data-checkout="cardNumber"]'), 'keyup', clearOptions
addEvent document.querySelector('input[data-checkout="cardNumber"]'), 'change', guessingPaymentMethod
cardsHandler()