clc;
clear;
boyutlar = [6 7 8 9 10];
index = randi([1 5], 1, 1);
n = boyutlar(index);
sayilar = 0:0.01:0.2;

% Matrisin Oluşturulması ve Rastgele Değerlerle Doldurulması
for i = 1:n
    for j = 1:n
        index = randi([1 21], 1, 1);
        A(i,j) = sayilar(index) * 0.5;
    end
end

% İlk Satır Toplamlarının Hesaplanması
for i = 1:n
    satirtoplam(i) = 0;
    for j = 1:n
        satirtoplam(i) = satirtoplam(i) + A(i,j);
    end
end

% Orijinal Matrisin ve Satır Toplamlarının Saklanması
A_orijinal = A;
satirtoplam_orijinal = satirtoplam;

% Son Sütundaki Değerlerin Düzeltilmesi
change = 0;
for i = 1:n
    y = satirtoplam(i) - A(i,n);
    q = 1 - y;
    if A(i,n) ~= q
        change = change + 1;
    end
    A(i,n) = q;
end

% Yeni Satır Toplamlarının Hesaplanması
for i = 1:n
    satirtoplam(i) = 0;
    for j = 1:n
        satirtoplam(i) = satirtoplam(i) + A(i,j);
    end
end

% Ekran Çıktısı
disp('Matris A:');
disp(A_orijinal);
disp('A Matrisi Satır Toplamları:');
disp(satirtoplam_orijinal);
disp('Markov Matrisi A:');
disp(A);
disp('Markov Matrisi A Satır Toplamları:');
disp(satirtoplam);
disp(['Değişen Eleman Sayısı: ', num2str(change)]);
