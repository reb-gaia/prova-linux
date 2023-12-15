#!/bin/bash

function celsius() {
  echo -n "Digite a temperatura em Celsius: "
  read celsius

  echo "1. Fahrenheit"
  echo "2. Kelvin"
  echo -n "Escolha a escala termométrica de saída: "
  read choice
  echo

  if [ $choice -eq 1 ]; then
    fahrenheit=$(echo "scale=2; ($celsius * 9/5) + 32" | bc)
    echo "$celsius graus Celsius é igual a $fahrenheit graus Fahrenheit."
  elif [ $choice -eq 2 ]; then
    kelvin=$(echo "scale=2; $celsius + 273.15" | bc)
    echo "$celsius graus Celsius é igual a $kelvin Kelvin."
  else
    echo "Opção inválida."
  fi
}

function fahrenheit() {
  echo -n "Digite a temperatura em Fahrenheit: "
  read fahrenheit

  echo "1. Celsius"
  echo "2. Kelvin"
  echo -n "Escolha a escala termométrica de saída: "
  read choice

  if [ $choice -eq 1 ]; then
    celsius=$(echo "scale=2; ($fahrenheit - 32) * 5/9" | bc)
    echo "$fahrenheit graus Fahrenheit é igual a $celsius graus Celsius."
  elif [ $choice -eq 2 ]; then
    kelvin=$(echo "scale=2; ($fahrenheit - 32) * 5/9 + 273.15" | bc)
    echo "$fahrenheit graus Fahrenheit é igual a $kelvin Kelvin."
  else
    echo "Opção inválida."
  fi
}

function kelvin() {
  echo -n "Digite a temperatura em Kelvin: "
  read kelvin

  echo "1. Celsius"
  echo "2. Fahrenheit"
  echo -n "Escolha a escala termométrica de saída: "
  read choice

  if [ $choice -eq 1 ]; then
    celsius=$(echo "scale=2; $kelvin - 273.15" | bc)
    echo "$kelvin Kelvin é igual a $celsius graus Celsius."
  elif [ $choice -eq 2 ]; then
    fahrenheit=$(echo "scale=2; (($kelvin - 273.15) * 9/5) + 32" | bc)
    echo "$kelvin Kelvin é igual a $fahrenheit graus Fahrenheit."
  else
    echo "Opção inválida."
  fi
}

function menu() {
  clear
  echo "Conversor de Temperatura"
  echo "1. Celsius"
  echo "2. Fahrenheit"
  echo "3. Kelvin"
  echo "0. Sair"
}

while true; do
  menu
  echo
  echo -n "Escolha a escala termométrica de entrada: "
  read choice

  case $choice in
    1) celsius ;;
    2) fahrenheit ;;
    3) kelvin ;;
    0) echo "Encerrando..."; exit ;;
    *) echo "Opção inválida. Tente novamente." ;;
  esac

  echo -n "Pressione Enter para continuar..."
  read enter
done