#menginput data Penjualan Produk
#menginstall library terkait time series
library(tseries)
library(forecast)
library(lmtest) #for coeftest
library(normtest) #for normality
library(nortest)

#mempersiapkan data
#mengganti label zt dengan penjualan
penjualan<-penjualanproduk$zt
penjualan
hari<-penjualanproduk$t

#membuat plot time series
ts.plot(penjualan)

#melakukan pengecekan kestasioneran data
adf.test(penjualan)

#membuat plot ACF dan PACF
par(mfrow=c(1,2))
acf(penjualan,lag.max = 46)
pacf(penjualan,lag.max = 46)

#menduga ARIMA
fit1<-Arima(penjualan,order = c(0,2,2),method = "ML")
fit1
#diagnostig checking
#1 Uji kesignifikanan uji t
coeftest(fit1)

#2 white noise
Box.test(fit1$residuals, type="Ljung")

#3. Penujian residual apakah berdistribusi normal
shapiro.test(fit1$residuals)
#Shapiro-Francia normality test
sf.test(fit1$residuals)
#Anderson-Darling normality test
ad.test(fit1$residuals)
#Lilliefors (Kolmogorov-Smirnov) normality test
lillie.test(fit1$residuals)

#forecast pada 3 tahap kedepan
forecastt<-forecast(penjualan,model=fit1,h=3)
forecastt