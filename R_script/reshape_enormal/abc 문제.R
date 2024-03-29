setwd('../../R-Programming/R Basic Source/07.data preprocessing/')
abcCsv = read.csv("abc.csv", header=TRUE)
abcCsv
# 
# # 나이가 30세 이하는 "청년층", 45세 이하는 "중년층", 이외는 "장년층"이라고 하자.
# # age2 컬럼을 코딩 변경(리코딩)하시오.
# 
sort(unique(abcCsv$age))
abcCsv$age2[abcCsv$age <= 30] <- '청년층'
abcCsv$age2[abcCsv$age <= 45 & abcCsv$age > 30] <- '중년층'
abcCsv$age2[abcCsv$age > 45] <- '장년층'
head(abcCsv[c('age', 'age2')])

# # 청년층 = 1, 중년층 = 2, 장년층 = 3이라고 하자.
# # 숫자 1, 2, 3을 컬럼으로 가지는 age3 컬럼을 코딩 변경(리코딩)하시오. 
# 
sort(unique(abcCsv$age))
abcCsv$age3[abcCsv$age2 == '청년층'] <- 1
abcCsv$age3[abcCsv$age2 == '중년층'] <- 2
abcCsv$age3[abcCsv$age2 == '장년층'] <- 3
head(abcCsv[c('age', 'age2', 'age3')])

# head(abcCsv[c("age", "age2", "age3")])
# #   age   age2 age3
# # 1  10 청년층    1
# # 2  20 청년층    1
# # 3  30 청년층    1
# # 4  40 중년층    2
# # 5  50 장년층    3
# # 6  60 장년층    3 
# 
# # total 변수를 이용해 High 그룹과 Low 그룹으로 나누기
# # High 그룹은 60이상이라고 가정한다.
# # 이하는 'low'라고 가정한다.
# # 이것을 위한 abcCsvtotal 컬럼을 리코딩하시오.
# 
sort(unique(abcCsv$total))
abcCsv$abcCsvtotal[abcCsv$total < 60] <- 'Low'
abcCsv$abcCsvtotal[abcCsv$total >= 60] <- 'High'
head(abcCsv[c('total', 'abcCsvtotal')])

# # survey 변수를 이용해 만족 그룹(Good)과 불만족 그룹(Bad)으로 나누기
# # 만족 그룹(Good)은 3이상이라고 가정한다.
# 
sort(unique(abcCsv$survey))
abcCsv$survey2[abcCsv$survey < 3] <- 'Bad'
abcCsv$survey2[abcCsv$survey >= 3] <- 'Good'
head(abcCsv[c('survey', 'survey2')])

abcCsv
# 
# 최종 결과는 다음과 같다.
# gender job age position address total check price survey   age2 age3
# 1      1   1  10        2   seoul    50     5  1200      3 청년층    1
# 2      1   2  20        5   busan    80    NA    NA     NA 청년층    1
# 3      1   2  30        4   daegu    60     5  2500      2 청년층    1
# 4      1   3  40        4   busan    70     3  1200      5 중년층    2
# 5      2   3  50        5   seoul    50     3  1400      6 장년층    3
# 6      2   2  60        7   daegu    40     3  3000      1 장년층    3
# 
# abcCsvtotal abcCsvsurvey
# 1         low         Good
# 2        high         <NA>
#   3        high          Bad
# 4        high         Good
# 5         low         Good
# 6         low          Bad
