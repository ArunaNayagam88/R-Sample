supercar <- ""
ValueForMoney <- "Value For Money Cars are"


for (i in 1:nrow(mtcars)){
  if (mtcars$hp[i] > 250) {
    supercar <- rbind(supercar, row.names(mtcars)[i])
  } else { 
    if (mtcars$hp[i] >= 150 && mtcars$mpg[i] > 15) {
      ValueForMoney <- rbind(ValueForMoney, row.names(mtcars)[i])
    }
  }
}

print( paste(supercar, " is a super car", sep = ""))
print(ValueForMoney)