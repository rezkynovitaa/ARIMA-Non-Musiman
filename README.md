# Arima Non Musiman
Peramalan (forecasting) dengan menggunakan data deret waktu (time series) adalah hal yang penting bagi seseorang yang menghadapi situasi yang tidak menentu. Oleh karena itu, pembahasan terkait pengertian deret waktu dan Model ARIMA yang dikembangkan oleh Box dan Jenkins adalah penting. data penjualan produk adalah salah satu contoh data yang dapat dianalisis menggunakan deret waktu. kita akan menentukan model ARIMA terbaik yang dapat digunakan, selain itu akan dilakukan peramalan untuk 3 tahap berikutnya. 

# Tahap Identifikasi
Langkah pertama yang dilakukan dalam pemodelan deret waktu adalah tahap identifikasi. Pada tahap identifikasi ini, hal yang dilakukan adalah memeriksa kestasioneran data baik dalam mean maupun dalam variansi. Kestasioneran data dalam rata-rata dapat diperiksa melalui plot time series secara visual atau melalui uji Augmented Dickey-Fuller
## 1. Identifikasi Plot Time Series
![image](https://user-images.githubusercontent.com/85878732/131203400-0811ad64-dada-401c-bb25-81cc1dc75397.png)

berdasarkan plot yang dihasilkan, terlihat bahwa terdapat tren (plot cenderung naik). 
## 2. Uji Augmented Dicky-Fuller
hipotesis dalam uji Augmented Dicky-Fuller adalah :
H0 : Data tidak Stasioner
H1 : Data Stasioner
![image](https://user-images.githubusercontent.com/85878732/131203484-afdad2a6-d71b-4110-abaf-a5b1bed4d0f6.png)

Berdasarkan hasil dari uji Augmented Dickey-Fuller Test, terlihat nilai p-value > 0.05 berarti Terima H0. Artinya data tidak stasioner

dari hasil Visual Plot Time Series yang menunjukkan tren (plot cenderung naik) dan uji Augmented Dicky-Fuller menunjukkan data tidak stasioner, maka perlu dilakukan differencing.

# Tahap Differencing
## Plot Differencing Pertama
![image](https://user-images.githubusercontent.com/85878732/131203562-0e7b329c-2d2a-4383-94c8-2eb1aeecd84b.png)

## Uji Augmented Dicky-Fuller Differencing Pertama
![image](https://user-images.githubusercontent.com/85878732/131203583-b2467199-e65a-4dff-b448-8d70a7117982.png)

Dari hasil visual time series, plot masih menunjukkan tidak stasioner, selain itu berdasarkan pengujian “Augmented Dickey-Fuller Test” diperoleh nilai p-value = 0,06285 yang berari bahwa hipotesis H0 gagal ditolak. Ini berarti bahwa data tersebut belum stasioner dalam rata-rata. Oleh karena itu, dapat kembali dilakukan proses differencing

## Plot DIfferencing Kedua
![image](https://user-images.githubusercontent.com/85878732/131203636-d24405ef-b35f-4710-86f8-ddfccd10499c.png)

## Uji Augmented Dicky-FUller DIfferencing Kedua
![image](https://user-images.githubusercontent.com/85878732/131203654-2b685d21-0ffe-4537-bd3f-76b0d2461f78.png)

Dari hasil visual time series, plot sudah stasioner, selain itu berdasarkan pengujian “Augmented Dickey-Fuller Test” diperoleh nilai p-value = 0,01 yang berari bahwa hipotesis H0 ditolak. Ini berarti bahwa data tersebut sudah stasioner.

# Identifikasi Plot ACF dan PACF Hasil Differencing
tahap ini akan membantu dalam pendugaan model ARIMA yang akan digunakan.
## Plot ACF dan PACF Differencing
![image](https://user-images.githubusercontent.com/85878732/131203722-5974c19a-e978-421a-9868-88c013bdd24f.png)

Berdasarkan plot ACF dan plot PACF tersebut, dapat dilihat bahwa plot ACF nya terpotong setelah lag 2 (cut off after lag 2), dan plot PACF nya turun secara eksponensial (dies down). Berdasarkan teori yang telah dibahas, model dugaan sementara untuk data tersebut adalah ARIMA (0, 2, 2).

# Menguji Model ARIMA 
![image](https://user-images.githubusercontent.com/85878732/131203855-a89b5d02-56a6-4ea1-8646-f59b264e581c.png)

dilakukan pengujian Diagnostic Checking untuk melihat kelayakan Model yang digunakan 

## Uji Kesignifikanan Parameter
![image](https://user-images.githubusercontent.com/85878732/131203876-d8cc6d7f-83d5-41bc-89b8-19e453b4b73e.png)

Berdasarkan hasil R, taksiran parameter model MA(1) dan MA(2) adalah signifikan berbeda dari nol. Hal ini dapat dilihat pada nilai Pr (>|z|) =0.007252 < alpha = 0,05, dan Pr (>|z|) =2.884e-06 < alpha = 0,05.

## Pengujian residual White noise melalui L-Jung Box test
H0  : Residual white noise

H1  : tidak residual white noise


![image](https://user-images.githubusercontent.com/85878732/131203896-c7923729-f460-4d8f-a0a1-ceba0020d20f.png)

Berdasarkan hasil output pengujian residual Ljung Box diperoleh p-value = 0,3927 > alpha = 0,05 yang berarti bahwa gagal tolak H0. Jadi dapat disimpulkan bahwa residual white noise.

## Pengujian residual berdistribusi normal
Pengujian apakah residual berdistribusi normal atau tidak dapat dilakukan melalui beberapa cara yaitu: uji Shapiro-Wilk, uji Shapiro-Francia, uji Anderson-Darling, atau uji Lilliefors (Kolmogorov-Smirnov). Adapun hipotesis untuk uji residual berdistribusi normal adalah : 
H0 : tidak berdistribusi Normal

H1 : Berdistribusi Normal

uji Shapiro-Wilk 

![image](https://user-images.githubusercontent.com/85878732/131203966-66caeac5-1b0d-46a2-9975-dd78d4af9dc5.png)

Uji Shapiro-Francia

![image](https://user-images.githubusercontent.com/85878732/131203973-3cae2f99-ec86-4666-b402-9aa556b82636.png)

Uji Anderson-Darling

![image](https://user-images.githubusercontent.com/85878732/131204009-c20eb611-ed7a-45d7-a6c6-b35bea8a8af5.png)

uji Lilliefors (Kolmogorov-Smirnov)

![image](https://user-images.githubusercontent.com/85878732/131204000-44d6f69e-72e8-4120-b629-8c9d2efb4435.png)

Berdasarkan hasil output pengujian normalitas diperoleh nilai p-value >  = 0,05 yang berarti bahwa Tolak H0. Jadi dapat disimpulkan bahwa residual memenuhi asumsi distribusi normal.

dari hasil identifikasi model, terlihat bahwa model telah memenuhi Asumsi uji kesignifikanan parameter, residual white noise dan residual berdistribusi normal, maka dapat dilakukan peramalan. 

# Peramalan 3 Tahap Kedepan
![image](https://user-images.githubusercontent.com/85878732/131204066-7f56ecbc-bc3c-4302-88dc-53c074078828.png)
