data.file = "hw6_input.csv"
ans.file = "hw6_answer.csv"
data<-read.csv(data.file, header=FALSE, sep=",")
ans <- read.csv(ans.file, header=FALSE, sep=",")
len<-30
f<-numeric(len)
r_fibonacci <- function(n){
		if(n<=1){
			return(n)
		}
		else{
			return(r_fibonacci(n-1)+r_fibonacci(n-2))
		}
	}


	
for(n in data){			
my_ans <- r_fibonacci(n)
if(my_ans!=ans[n]){print(c("error", n, my_ans, ans[n]))}
}