//                              Символы и строки

// Задание 1.
// Написать программу, которая принажатии
// клавиши на клавиатуре
// выводит нажатый символ, десятичный код
// символа и двоичный код символа.

uses crt;
var c: char; // объявление считываемого символа

begin
  repeat
    c := ReadKey; // считывание нажатой клавиши
    writeln('Вы ввели символ ', c, 'его код - ', ord(c)); // вывод символа и его 'кода'
  until ord(c)=27; // завершение цикла по клавише ESC

end.

// ---------------------------------------

// Задание 2.
// Пользователь вводит с клавиатуры
// строку-предложение.
// Посчитать количество знаков препинания
// в этом предложении.
// Следует учесть, что знак многоточие
// (...) необходимо считатьза один знакпрепинания.

var puncs: array[0..11] of string; // объявление массива со знаками препинания
var inputString: string; // вводимая строка
var i, pCounter: integer; // счетчики

begin
    pCounter := 0;
    puncs[0] := '(';
    puncs[1] := ')';
    puncs[2] :='.';
    puncs[3] :=',';
    puncs[4] := ':';
    puncs[5] := ';';
    puncs[6] := '?';
    puncs[7] := '!';
    puncs[8] := '...'; 
    puncs[9] := '-';
    puncs[10] := '"';
    puncs[11] :='/';
    // выше - присваивание элементам массива соответствующих значений
    readln(inputString); // считывание введенного текста
    writeln('Предложение: ', inputString); // вывод введенного текста
    for i := 0 to 11 do // инициализация цикла для иттерирования массива со знаками препинания
    begin
        if (pos(puncs[i], inputString) <> 0) then // условие обнаружения любого из представленных в массиве знаков препинания
        begin
            pCounter := pCounter + 1; // при удовлетворении условию выше - инкрементирование счетчика знаков препинания
        end;
    end;
    write('Знаков препинания: ', pCounter); // результирующий вывод
end.

// ---------------------------------------

// Задание 3.
// Вводятся два слова на русском языке,
// вывести третье слово, которое будет являться
// склейкой первой половины второго слова и второй
// половины первого слова.

var firstWord, secondWord, concatWord: string; // объявление переменных для хранения слов
var firstHalf, secondHalf:integer; // объявление счетчиков

begin
  readln(firstWord); // считывание первого слова
  readln(secondWord); // считывание второго слова
  SetLength(firstWord, Round(Length(firstWord)/2)); // укорачивание первого слова на его округленный результат деления длины на двое
  SetLength(secondWord, Round(Length(secondWord)/2)); // укорачивание второго слова на его округленный результат деления длины на двое
  concatWord := firstWord + secondWord; // конкатенация результирующего слова из двух половин первого и второго
  writeln(concatWord); // результирующий вывод
end.

// ---------------------------------------

// Задание 4.
// Дана  строка,  содержащая  буквы  и  скобки.
// Проверить,правильно ли расставленыскобки, то есть каждой
// открывающейсоответствует одна закрывающая
// Скобки могут быть как круглые, так и квадратные или фигурные.

var inputString:string = 'H((el[]{lo, Wo))rl}d!'; // объявление тестовой строки
var Arr: array of Char; // объявление массива символов для разбиения строки
var i, oBrace, cBrace, oCBrace, cCBrace, oFBrace, cFBrace: Integer; // объявление счетчиков
 
begin
    SetLength(Arr, Length(inputString)); // инициализация длины массива, равной длине введенной (тестовой) строки
    for i := 1 to Length(inputString) do // иттерация по длине строки (обращение по индексу 0 = ошибка)
      begin
          Arr[i - 1] := inputString[i]; // из-за причины, указанной комментарием выше, индекс символа из строки в массиве = i-1
      end;
     for i := 0 to Length(Arr) - 1 do // иттерация по длине массива с символами из строки на условие содержания одного из видов скобок
     begin
        if Arr[i] = '(' then oBrace := oBrace +1; // при обнаружении (из массива символов из строки) указанной скобки - инкремент соответствующего счетчика
        if Arr[i] = ')' then cBrace := cBrace +1; // при обнаружении (из массива символов из строки) указанной скобки - инкремент соответствующего счетчика
        if Arr[i] = '[' then oCBrace := oCBrace +1; // при обнаружении (из массива символов из строки) указанной скобки - инкремент соответствующего счетчика
        if Arr[i] = ']' then cCBrace := cCBrace +1; // при обнаружении (из массива символов из строки) указанной скобки - инкремент соответствующего счетчика
        if Arr[i] = '{' then oFBrace := oFBrace +1; // при обнаружении (из массива символов из строки) указанной скобки - инкремент соответствующего счетчика
        if Arr[i] = '}' then cFBrace := cFBrace +1; // при обнаружении (из массива символов из строки) указанной скобки - инкремент соответствующего счетчика
        
     end;
    if (oBrace = cBrace) and (oCBrace = cCBrace)and (oFBrace = cFBrace) then writeln('OK') else writeln('NE OK'); // при равном количестве ВСЕХ НАЙДЕННЫХ типов скобок - удовлетворительный результат
end.

// ---------------------------------------

//                              Сортировка массива


// Сортировка одномерного массива

const N = 10; // размер
var A: array [1..N] of integer; // объявление массив по размеру
var i, j: integer; // объявление счетчиков

begin
    for i := 1 to N do // заполнение массива случайными числами в пределе сотни
    begin
        A[i] := random(100);
        write(A[i], ' ') // вывод сгенерированного массива
    end;
    writeln; // пустая строка
    for i := 1 to N-1 do // иттерация по массиву [Индекс I]
    begin
        for j := i + 1 to N do // иттерация по массиву на шаг вперед [Индекс J]
        begin
            if A[i] > A[j] then // при условии разности в значениях массива иттераций I и J (текущего и слелдующего значения)
            begin
                A[i] := A[i] + A[j]; // выполняется сохранение значения из иттерации J сложением в текущее 
                A[j] := A[i] - A[j]; // за ним следует присваивание значению цикла J разности значения J и I 
                A[i] := A[i] - A[j] // и в итоге происходит возвращение текущего значения к разности текущего и перезаписанного 'следующего'. 
            end; // то есть - происходит обычная перестановка. Слегка модифицированный в худшую сторону пузырьковый метод сортировки.
        end;
    end;
    for i := 1 to N do // иттерация для вывода массива
    begin
        write(A[i], ' ')
    end;
end.

// ---------------------------------------

// Сортировка двумерного массива

const N = 4; // размерность
const M = 4; // массива
var A: array [1..N, 1..M] of integer; // объявление массива по его размерам
var B: array [1..M*N] of integer; // объявление одномерного массива длиной в разложенный двумерный))
var i, j, k, x: integer; // счетчики

begin
    x := 1; // счетчик для удачного развертывания значений двумерного массива в одномерный
    for i := 1 to N do // иттерация по N-стороне 2D-массива
    begin
        for j := 1 to M do // иттерация по M-стороне 2D-массива
        begin
          A[i, j] := random(100); // заполнение текущего значения 2D-массива случайным значением в пределе сотни
          B[x] := A[i, j]; // присваивание значения, указанного выше, развернутому одномерному массиву
          x := x + 1; // инкрементирование индекса текущего значения для удачного развертывания одномерного массива
        end;
    end;
    writeln; // пустая строка
    for i:=1 to N do // двумерная иттерация для вывода двумерного массива...
     begin  
        for j:=1 to M do  
           write(a[i,j]:2,' ');  // вывод
        writeln;   // пустая линия
     end;  
     
    for i := 1 to N*M do // иттерация по развернутому 
    begin // одномерному массиву модифицированным 
        for j := i + 1 to N*M do // в худшую сторону методом пузырька, 
        begin // описанным в сортировке одномерного массива
            if B[i] > B[j] then
            begin
                B[i] := B[i] + B[j];
                B[j] := B[i] - B[j];
                B[i] := B[i] - B[j]
            end;
        end;
    end;
 
    x := 1; // свертывание одномерного массива в двумерный 
    for i := 1 to N do // путем иттерации по указанным 
    begin
        for j := 1 to M do // в константах размерам N и M
        begin
          A[i, j] := B[x]; // задание значения текущему по значениям счетчиков
          x := x + 1; // значениям двумерного массива и инкремент счетчика 
        end; // для успешного свертывания одномерного массива
    end;

   writeln; // пустая строка
   writeln; // пустая строка
   writeln; // пустая строка
   for i:=1 to N do // иттерация по двумерному массиву
     begin  // для его
        for j:=1 to M do  // выво
           write(a[i,j],' ');   // да
        writeln;  // пустая строка
     end;  
end.

// ---------------------------------------

// Сортировка двумерного массива и заполнение змиейкой

const N = 5;
const M = 3;
var A: array [1..N, 1..M] of integer;
var B: array [1..M*N] of integer;
var i, j, k, x: integer;

begin
    x := 1;
    for i := 1 to N do
    begin
        for j := 1 to M do
        begin
          A[i, j] := random(100);
          B[x] := A[i, j];
          x := x + 1;
        end;
    end;
    writeln;
    for i:=1 to N do
     begin  
        for j:=1 to M do  
           write(a[i,j]:2,' ');  
        writeln;  
     end;  
     
    for i := 1 to N*M do
    begin
        for j := i + 1 to N*M do
        begin
            if B[i] > B[j] then
            begin
                B[i] := B[i] + B[j];
                B[j] := B[i] - B[j];
                B[i] := B[i] - B[j]
            end;
        end;
    end;
            // Совершенно соответственная предыдущему алгоритму
            // сортировка. Вся разница только в выводе.
            // Вывод начинается здесь...
            // Точнее изменение свертывания одномерного массива.
    x := 1;
    for i := 1 to M do // инвертирование условий иттерации, т.к. идем вертикально
    begin
        for j := 1 to N do // инвертирование условий иттерации, т.к. идем вертикально
        begin
          if i mod 2 = 0 then // если мы находимся на четном столбце  
          begin
             A[j][i] := B[x]; // задаем соответствующие (ожидаемые (снизу вверх)) значения строкам
          end
          else
          begin
              A[N-j+1, i] := B[x]; // в любом другом случае - задаем значения сверху вниз
          end;
          x := x + 1;
        end;
    end;

   writeln;
   writeln;
   writeln;
   for i:=1 to N do
     begin  
        for j:=1 to M do  
           write(a[i,j],' ');  
        writeln;  
     end;  
end.

// ---------------------------------------

// Сортировка двумерного массива и заполнение спиралью

const N = 4;
const M = 5;
var A: array [1..N, 1..M] of integer;
var B: array [1..M*N] of integer;
var i, j, k, x: integer;

begin
    x := 1;
    for i := 1 to N do
    begin
        for j := 1 to M do
        begin
          A[i, j] := random(100);
          B[x] := A[i, j];
          x := x + 1;
        end;
    end;
    writeln;
    for i:=1 to N do
     begin  
        for j:=1 to M do  
           write(a[i,j]:2,' ');  
        writeln;  
     end;  
     
    for i := 1 to N*M do
    begin
        for j := i + 1 to N*M do
        begin
            if B[i] > B[j] then
            begin
                B[i] := B[i] + B[j];
                B[j] := B[i] - B[j];
                B[i] := B[i] - B[j]
            end;
        end;
    end;
            // Совершенно соответственная предыдущему алгоритму
            // сортировка и частично вывод.
            // Изменения:

    x := 1;
    for i := 1 to N do // возвращение обратно к традиционному методу иттерации строк-столбцов
    begin
        for j := 1 to M do // возвращение обратно к традиционному методу иттерации строк-столбцов
        begin
          if i mod 2 = 0 then
          begin
              A[i][M-j+1] := B[x]; // если мы на четной строке, то заполняем столбцы с конца
          end
          else
          begin
              A[i, j] := B[x]; // в любом другом случае заполняем их как положено.
          end;
          x := x + 1;
        end;
    end;

   writeln;
   writeln;
   writeln;
   for i:=1 to N do
     begin  
        for j:=1 to M do  
           write(a[i,j],' ');  
        writeln;  
     end;  
end.