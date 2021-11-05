# poc_arch


# FEATURES: 
Pasta local responsável por guardar as camadas de um fluxo/feature, dentro de cada feature teremos a model, viewmodel, view, utils, e builders

# UTILS: 
Além de guardar as utils default da feature, também pode guardar as keys dos widgets

# TEST: 
Os testes ficam na raiz, espelhando a arquitetura do código de produção.

# UI: 
Responsável por guardas os componentes locais, e ter a lógica de ui dentro do próprio widget, preferencialmente usando o padrão Atomic Design para separar bem os widgets com suas lógicas embutidas 

# ViewModel (Cubit/BLOC): 
Será chamada quando for necessário fazer uma requisição a uma API externa, não deve guardar estados, e sim emiti-los para que a UI possa reagir adequadamente a cada um deles. Deve transformar o objeto Response que retorna da repository, e transforma-la em uma model que sera usada na VIEW, dentro dessa model terao as trativas de necessárias para que a tela somente os exiba

# Repository: 
Será responsável por chamar o CoreRequester, que irá retornar uma Response, Http/Dio ou algum outro tipo, após receber os dados corretos, deve serializa-lo em um objeto dart fiel a resposta do back end e retorna-lo a Cubit, caso receba uma exceção, dá um rethrow e sobe para a cubit 
