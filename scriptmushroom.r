library('caret')
library('dplyr')
datos<-read.csv('mushrooms.csv')
#str(datos)
datos <- select(datos, -veil.type) #eliminamos la columna veil.type
#str(datos)
#datos$class
#length(which(datos$class=='p'))
class = ifelse(datos$class=='e',"Comestible", "Venenosa")
datos$class = as.factor(class)
names(datos)[1]="class"
t.caret = train(class~., data = datos, method = "rpart2", tuneLength=6)
t.caret
plot(t.caret$finalModel)
text(t.caret$finalModel, pretty=F )
