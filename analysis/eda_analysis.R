
library(corrplot)
data<-read.csv("/Users/dishitarathore/Desktop/anomaly_detection_project/data/ai4i2020.csv")

print("---Data Structure---")
str(data)
summary(data)

failure_counts<-table(data$Machine.failure)
barplot(failure_counts,main="Normal(0) vs Failed(1) Machines",
col=c("green","red"),names.arg=c("Healthy","Failed"))

#correlation heatmap
numeric_cols <- data[, c("Air.temperature..K.", "Process.temperature..K.", 
                         "Rotational.speed..rpm.", "Torque..Nm.", 
                         "Tool.wear..min.", "Machine.failure")]

cor_matrix <- cor(numeric_cols)
corrplot(cor_matrix, method="circle", type="upper", 
         title="Sensor Correlation Matrix", mar=c(0,0,1,0))
