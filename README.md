![abrabant's stats](https://badge42.herokuapp.com/api/stats/abrabant)
![abrabant's libasm final grade](https://i.imgur.com/Y98wRdn.png)

# libasm

`libasm` is a **x86_64 assembly** project we had to do as 42 students (I did it when it was still available in the common core of the 42 cursus). 

This project is basically about implementing functions of the C standard library in x86_64 assembly, for a **linux based OS**.

The bonus part is in my opinion the most interesting, as it asks us to implement C functions we coded before during the C *piscine* (the selection one), such as `ft_atoi_base` and others dealing with linked list implementation. That's harder than just coding a simple `ft_strlen` as you may guess, but at the end that's really interesting and I really enjoyed the project !

# Compiling the libasm

## Requirements

- A linux based OS.
- The clang C compiler (clang-9 is preferred), for easy linking with the C standard library.
- The `nasm` ASM compiler.

## Compiling

Just run `make`. It should generate a `libasm.a` archive if everything went well. 

# Testing

I made a public testing program in order to ensure the libasm is implemented properly, that you can find [here](https://github.com/aurelien-brabant/libasm-smasher). It mainly
tests the mandatory part though.
