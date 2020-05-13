# Pacote quantmod
# http://www.quantmod.com


# Pacotes
install.packages("quantmod")
install.packages("xts")
install.packages("moments")
library(quantmod)
library(xts) # Permite trabalhar com xts (série temporal)
library(moments)


# Seleção do período de análise
startDate = as.Date("2019-03-20")
endDate = as.Date("2020-03-20")


# Download dos dados do período
papel <- getSymbols("LREN3.SA", src = "yahoo", from = startDate, to = endDate, auto.assign = F)
class(papel)


# Visualizando os dados
head(papel)
View(papel)


# Plot do fechamento
papel.Adjusted <- papel[, 6]
papel.Adjusted <- na.omit(papel.Adjusted)

plot(papel.Adjusted, main = "Fechamento Diário do preço da Ação",
     col = "red", xlab = "Data", ylab = "Preço", major.ticks = 'months',
     minor.ticks = FALSE)


# Gráfico de candlestick da ação
candleChart(papel)


# Adicionado as bandas de bollinger ao gráfico, com média de 20 períodos e 2 desvios padrão
addBBands(n = 20, sd = 2)

