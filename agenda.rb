# Agenda em ruby 
# Funcionalidades:
# Adicionar, Editar e Remover Contatos
# Os Contatos terão as seguintes informações: Nome e Telefone
# Poderemos ver todos os contatos redistrados ou apenas um contato

@agenda = [
  {nome: "Fizz", telefone:    "99998888"},
  {nome: "Jayce", telefone:   "54646465"},
  {nome: "Lucin", telefone:   "24424324"},
  {nome: "Jax", telefone:     "42554242"},
  {nome: "Viktor", telefone:  "45552412"},
  {nome: "Yasuo", telefone:   "30233323"},
  {nome: "Brawn", telefone:   "21332023"},
  {nome: "Akshan", telefone:  "41223505"},
]

def all_contacts
  @agenda.each do |contato|
    puts "#{contato[:nome]} - #{contato[:telefone]}"
    
  end

  puts "-------menu--------"
end

def new_contact
  print "Nome: "
  nome = gets.chomp
  print "Telefone: "
  telefone = gets.chomp

  @agenda << {nome: nome, telefone: telefone}
end

def show_contact
  print "Qual contato você está buscando: "
  nome = gets.chomp
  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
      puts "\n#{contato[:nome]} - #{contato[:telefone]}"
    end
  end 
end

def edit_contact
  print "Qual nome você deseja editar: "
  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
      #para alterar o nome
      print "Novo nome (Caso queira manter o mesmo nome precione ENTER): "
      saved_name = contato[:nome] 
      
      contato[:nome] = gets.chomp
      contato[:nome] = contato[:nome].empty? ? saved_name : contato[:nome]

      #para alterar o telefone 
      print "Novo número (Caso queira manter o mesmo número precione ENTER): "
      phone_number = contato[:telefone] 
      
      contato[:telefone] = gets.chomp
      contato[:telefone] = contato[:telefone].empty? ? phone_number : contato[:telefone]
    end
  end
end

def delete_contact
  print "Qual contato você deseja remover: "
  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
      indice = @agenda.index(contato)
      @agenda.delete_at(indice)
      break
    end  
  end 
end


puts "\nOlá Mestre Bem-Vindo de volta!\n"
puts "\nO que gostaria de fazer ?"
puts "--------------------------"

loop do 
  
  puts "1. Ver Contatos\n2. Adicionar Contato\n3. Buscar Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair";

  codigo = gets.chomp.to_i

  case 
  when codigo == 0
    puts "Até mais !!"
    break

  when codigo == 1
    all_contacts

  when codigo == 2
    new_contact

  when codigo == 3
    show_contact

  when codigo == 4
    edit_contact

  when codigo == 5
    delete_contact
  else
    puts "Função não encontrada, favor usar uma função válida"
  end

end 