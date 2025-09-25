; 声明运行时库函数
declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putarray(i32, i32*)

; 判断质数
define i32 @is_prime(i32 %n) {
entry:
  ; if (n < 2) return 0;
  %cmp1 = icmp slt i32 %n, 2
  br i1 %cmp1, label %ret0, label %loop_init

ret0:
  ret i32 0

loop_init:
  ; i = 2
  %i = alloca i32
  store i32 2, i32* %i
  br label %loop_cond

loop_cond:
  %i_val = load i32, i32* %i
  %i2 = mul i32 %i_val, %i_val
  %cond = icmp sle i32 %i2, %n
  br i1 %cond, label %loop_body, label %end_loop

loop_body:
  ; if (n % i == 0) return 0;
  %i_now = load i32, i32* %i
  %rem = srem i32 %n, %i_now
  %is_div = icmp eq i32 %rem, 0
  br i1 %is_div, label %ret0, label %loop_inc

loop_inc:
  %i_cur = load i32, i32* %i
  %i_next = add i32 %i_cur, 1
  store i32 %i_next, i32* %i
  br label %loop_cond

end_loop:
  ret i32 1
}

; 全局变量 记录前三个质数
@primes = global [3 x i32] zeroinitializer

; 主函数部分
define i32 @main() {
entry:
  ; a = getint(), b = getint()
  %a = call i32 @getint()
  %b = call i32 @getint()
  %total = alloca i32
  store i32 0, i32* %total

  ; i = a
  %i = alloca i32
  store i32 %a, i32* %i
  br label %loop_cond

loop_cond:
  %i_val = load i32, i32* %i
  %cmp = icmp sle i32 %i_val, %b
  br i1 %cmp, label %loop_body, label %after_loop

loop_body:
  %i_cur = load i32, i32* %i
  %is_p = call i32 @is_prime(i32 %i_cur)
  %check = icmp ne i32 %is_p, 0
  br i1 %check, label %if_prime, label %loop_inc

if_prime:
  ; total++
  %t1 = load i32, i32* %total
  %t2 = add i32 %t1, 1
  store i32 %t2, i32* %total

  ; if (total < 4) primes[total-1] = i
  %cmp_total = icmp slt i32 %t2, 4
  br i1 %cmp_total, label %store_prime, label %loop_inc

store_prime:
  %idx = sub i32 %t2, 1
  %idx64 = sext i32 %idx to i64
  %ptr = getelementptr [3 x i32], [3 x i32]* @primes, i64 0, i64 %idx64
  %val = load i32, i32* %i
  store i32 %val, i32* %ptr
  br label %loop_inc

loop_inc:
  %i_old = load i32, i32* %i
  %i_next = add i32 %i_old, 1
  store i32 %i_next, i32* %i
  br label %loop_cond

after_loop:
  ; putint(total)
  %t_final = load i32, i32* %total
  call void @putint(i32 %t_final)

  ; putch(10)
  call void @putch(i32 10)

  ; putarray(3, primes)
  %ptr0 = getelementptr [3 x i32], [3 x i32]* @primes, i64 0, i64 0
  call void @putarray(i32 3, i32* %ptr0)

  ret i32 0
}
