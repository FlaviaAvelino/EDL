# Introdução
O Groovy é uma linguagem orientada a objeto e dinamicamente tipada voltada para a plataforma Java e destinada a melhorar a produtividade do desenvolvedor apresentando uma sintaxe concisa, familiar e fácil de aprender. Integra-se perfeitamente com qualquer programa Java e entrega imediatamente aos recursos poderosos do seu aplicativo, incluindo recursos de script, criação de idioma específica do domínio, tempo de execução e programação de tempo de compilação e programação funcional.

A linguagem Groovy utiliza uma sintaxe similar à de Java, é compilada dinamicamente para bytecode Java, e integra-se transparentemente com outros códigos e bibliotecas Java.
# Origens e Influências
Seu surgimento se deu em agosto de 2003 quando James Strachan escreveu em seu blog o primeiro artigo sobre o que viria a ser o Groovy. Segundo James a ideia inicial era fazer uma linguagem dinâmica, que fosse compilada diretamente em classes Java, e que tivesse toda a produtividade e elegância encontrada em Ruby e Python”. 
A versão numerada 1.0 foi lançada em 2 de janeiro de 2007. Em 2 de julho de 2012, o Groovy 2.0 foi lançado apresentando novos recursos tais como a adição de compilação estática e verificação do tipo estático. Até hoje tem a versão 2.4 como o principal lançamento. Além de Java, Ruby e Phyton, Suas principais influências para a criação do Groovy foram Pearl, Smalltalk e Obective-C.

# Classificação
Groovy tem as seguintes características:
*	Suporte para tipagem estática e dinâmica. 
*	Imperativa
*	Funcional 
*	Sintaxe nativa para listas e arrays associativos. 
*	O suporte nativo para expressões regulares. 
*	O suporte nativo para várias linguagens de marcação como XML e HTML. 
*	Semelhança com a linguagem Java
*	Incorpora bibliotecas do Java. 
*	Groovy estende a Java.lang.Object. 
*	Metaprogramação

# Avaliação Comparativa

## Groovy vs Java
1. Na Linguagem Java você é obrigado a digitar private para declarar atributos privados. No Groovy todos os atributos de uma classe são por padrão private.
2. Em Java para declarar um método público é necessário digitar public. No Groovy não, pois por padrão já são públicos.
3. Na linguagem Java é obrigatório a digitar os get’s e set’s para expor os atributos dos objetos. No Groovy não, eles serão automaticamente e dinamicamente gerados.
4. O Groovy é um superconjunto do Java, o que significa que um programa Java funcionará bem no ambiente Groovy, mas vice-versa pode ou não ser executado, dependendo se está escrito em groovy ou Java.
5. Para tornar as coisas concisas, o Groovy forneceu vários métodos de utilidade, por exemplo, para imprimir algo no console, em vez de usar System.out.println , você pode simplesmente usar println () . 
6. Outra diferença importante entre o Groovy e o Java é que o groovy suporta a substituição de variáveis usando aspas duplas, ou seja, você pode imprimir conteúdo dinâmico sem usar concatenação de string, por exemplo:
```groovy
                               println ( “Bom dia $ nome!” );
```
7. Especificar o tipo. Em Java é obrigatório, mas em Groovy é opcional. Em Groovy é possível determinar uma tipagem dinâmica utilizando a palavra chave ***def***. Em Java se o tipo não for especificado o código não é compilado.
```groovy
classe saudacoes {
     		def salve (nome) {
         			println ( "Bom dia $ nome!" );
     		}
 
	     static def main (args) {
         		Saudacoes manhã = novo Saudacoes ();
         		def name = 'James' ;
         		morning.greet (nome);
    		}
	}
```
8. Em Java, você precisa do método principal para tornar uma classe executável, no Groovy você não precisa disso. Uma vez que o Groovy é uma linguagem de script, existe automaticamente uma classe de wrapper chamada Script para cada programa. Isso significa que você pode se livrar de sua própria classe de embrulho, bem como o método principal, assim:
```groovy
def salve (nome) {
         println ( "Bom dia $ nome!" );
 }
 def name = 'Steve'
 cumprimentar (nome)
```
A linguagem Groovy utiliza o conceito de programação orientada a protótipo, que se trata de uma forma de programação orientada a objeto onde novos objetos são criados a partir de um protótipo. E eles podem ter sua estrutura alterada em tempo de execução; o comportamento de um novo objeto é realizado através de um processo de expansão do comportamento de objetos já existentes.

## MetaProgramação
O Groovy permite que classes e métodos sejam alterados em tempo de execução. Utiliza as regras provenientes do MOP (Meta-Object Protocol) para a realização da expansão de classes e objetos, já existentes, em tempo de execução. Ao criar uma metaclasse define-se o comportamento de certas classes e de suas instancias.

# Exemplo de códigos representativos

### Hello World em Java
```java
public class HelloWorld {
   public static void main(String[] args) {
      System.out.println("Hello World!");
   }
}
```
### Hello World em Groovy
```groovy
println "Hello World!"
```
### Criando um List e um Map em Java
```java
List minhaLista = new ArrayList();
minhaLista.add("maçã");
minhaLista.add("laranja");
minhaLista.add("limão");
Map meuMap = new HashMap();
meuMap.put(3, "três");
meuMap.put(6, "seis");
meuMap.put(1, "um");
```
### Criando um List e um Map em Groovy
```groovy
List minhaLista = ["maçã", "laranja", "limão"]
Map meuMap = [3: "três", 6: "seis", 1: "um"];
```

```java 
package javatipos;
    public class JavaTipos {
        public static void main(String[] args) {
                String a = "10";
                a = a + 20;
               System.out.println("a = " + a);
                a = "10";
                int b;
                b = Integer.parseInt(a);
                b = b + 20;
                System.out.println("b = " + b);          
    }
}
```
### Conversão de Tipos em Groovy
```groovy
>> a = "10"
>> a + 20
>> 1020
>> a = 10
>> a + 20
>> 30
```
## Metaprogramação
* Adicionando um novo método à classe String
```groovy 
String.metaClass.digaOla = { lang -> if (lang == 'English') println 'Hello'
else  if (lang == 'Swedish') println 'Hej'
}

'Chamando o diga Olá por uma String'.digaOla('Swedish')

class Pessoa{
String nome, sobrenome
}

Pessoa.metaClass.getNomeCompleto = { nome + ", " + sobrebome }

println new Pessoa(nome:'groovy', sobrenome : 'Grails').getNomeCompleto()
```
* Adicionando comportamentos diferentes em objetos da mesma classe
### Em Groovy
```groovy
class Animal {
  String nome
  String tipo
  int idade
  
  Animal(String nome, int idade, String tipo){
      this.nome = nome;
      this.idade = idade;  
      this.tipo = tipo;
  }
}

Animal.metaClass.raca = "";

def cat = new Animal("Felix", 2, "Gato")
def dog = new Animal("Bob", 1, "Cachorro")

cat.raca = "siames" 
dog.raca = "vira-lata"

cat.metaClass.miar(){-> println "miau miau"}

dog.metaClass.latir(){-> println "au au"}

println "Caracteristicas Gato"
println "Nome: " + cat.nome 
println "Idade: " + cat.idade
println "Tipo: " + cat.tipo
println "Raca: " + cat.raca
cat.miar()

println " " 
println "Caracteristicas Cachorro"
println "Nome: " + dog.nome 
println "Idade: " + dog.idade
println "Tipo: " + dog.tipo
println "Raca: " + dog.raca
dog.latir()

println " "

assert cat.miar() == "au au"
```
### Em Java
* Classe Animal
```java
package javaclasses;

public class Animal {
    private String nome;
    private String tipo;
    private int idade;
        
    Animal (String nome, int idade, String tipo){
      this.nome = nome;
      this.idade = idade;  
      this.tipo = tipo;
  }
    
     public String getNome() { return this.nome;}
    
      public int getIdade() { return this.idade;}
       
      public String getTipo() { return this.tipo;}              
}
```
* Classe Gato
```java
package javaclasses;

public class Gato extends Animal{
    
    private String raca;
    
    Gato (String nome, int idade, String tipo){
        super(nome, idade, tipo);
    }
    
    void miar(){ System.out.println("miau miau");
    }
    
    @Override 
    public String getNome() {
        return super.getNome();
    }
    
    @Override 
      public int getIdade() {
        return super.getIdade();
    }
      
    @Override    
      public String getTipo() {
        return super.getTipo();
    }
    
    public String getRaca() { return this.raca; }
      
    public void setRaca(String raca) { this.raca = raca;}     
}
```
* Classe Cachorro
```java
package javaclasses;

public class Cachorro extends Animal{
    
    private String raca;
    
    Cachorro (String nome, int idade, String tipo){
        super(nome, idade, tipo);
    }
    
    void latir(){System.out.println("au au");}
    
    @Override
    public String getNome() {
        return super.getNome();
    }
    
    @Override
    public int getIdade() {
        return super.getIdade();
    }
    
    @Override
    public String getTipo() {
       return super.getTipo();
    }
       
    public String getRaca() { return this.raca;}
     
    public void setRaca(String raca) { this.raca = raca;}    
}
```
* Programa Principal
```java
package javaclasses;

public class JavaClasses {

    public static void main(String[] args) {
        
        Gato cat = new Gato("Felix", 2, "Gato");    
        Cachorro dog = new Cachorro("Bob", 1, "Cachorro");
        
        cat.setRaca("siames" );
        dog.setRaca("vira-lata");
        
        System.out.println("Caracteristicas Gato");
        System.out.println("Nome: " + cat.getNome());
        System.out.println("Idade: " + cat.getIdade());
        System.out.println("Tipo: " + cat.getTipo());
        System.out.println("Raca: " + cat.getRaca());
        cat.miar();
        
        System.out.println(" ");

        System.out.println("Caracteristicas Cachorro");
        System.out.println("Nome: " + dog.getNome());
        System.out.println("Idade: " + dog.getIdade());
        System.out.println("Tipo: " + dog.getTipo());
        System.out.println("Raca: " + dog.getRaca());
        dog.latir();
    }  
}
```
* Adicionando novos atributos em classe e objetos
### Em Groovy
```groovy
class Pessoa {
  String nome
  int idade
  
  Pessoa(String nome, int idade){
      this.nome = nome;
      this.idade = idade;  
  }
}

Pessoa.metaClass.telefone = 00000000

def p1 = new Pessoa("Ana", 22)

assert p1.telefone == 00000000

Pessoa.metaClass.Mudar_Telefone(){int num -> delegate.telefone = num}

p1.Mudar_Telefone(25709494)


def p2 = new Pessoa("Paulo", 30)

assert p2.telefone == 00000000

p1.metaClass.pais = "Brasil"
p1.metaClass.Meu_Pais(){-> println "Eu sou do pais: $delegate.pais"}
p1.metaClass.idioma = "Portugues"


println "Objeto p1 Caracteristicas"
println "Nome = " + p1.nome
println "Idade = " + p1.idade
println "Telefone = " + p1.telefone
println "Idioma = " + p1.idioma
p1.Meu_Pais();
println " "

println "Objeto p2 Caracteristicas"
println "Nome = " + p2.nome
println "Idade = " + p2.idade
println "p2 telefone = " + p2.telefone
println "Idioma = " + p2.idioma
```
### Em Java
* Classe Pessoa
```java
package javaexemplo;

public class Pessoa {
    
    private String nome;
    private int idade;
  
  Pessoa(String nome, int idade){
      this.nome = nome;
      this.idade = idade;  
  }
  
  public String getNome() { return this.nome;}
    
  public int getIdade() { return this.idade;}   
}
```
* Classe PessoaExtendido
```java
package javaexemplo;

public class PessoaExtendido extends Pessoa{
    
    private int telefone;

  PessoaExtendido(String nome, int idade){
      super (nome, idade); 
  }
  
  void Mudar_Telefone(int num ){
      this.telefone = num;
  }
  
  public int getTelefone() {return this.telefone;}
  
  @Override 
      public String getNome() {
        return super.getNome();
      } 
  
  @Override 
      public int getIdade() {
        return super.getIdade();
      } 
}
```
* Programa PessoaMaisExtendido
```java
package javaexemplo;

public class PessoaMaisExtendido extends PessoaExtendido{
    
    private String pais, idioma;
    
    PessoaMaisExtendido(String nome, int idade){
       super (nome, idade); 
    }
    
    public void setPais(String pais) { this.pais = pais;}
        
    void Meu_Pais(){System.out.println("Eu sou do pais: " + this.pais);}
    
    public void setIdioma(String idioma) { this.idioma = idioma;}    
    
    public String getIdioma() {return this.idioma;}
    
    
@Override 
      public String getNome() {
        return super.getNome();
      } 
    @Override 
      public int getIdade() {
        return super.getIdade();
      }
     
      @Override 
      public int getTelefone() {
        return super.getTelefone();
      } 
      
      void Mudar_Telefone(int num ){
        super.Mudar_Telefone(num);
    }
}
```
* Programa Principal
```java
package javaexemplo;

public class JavaExemplo {

    public static void main(String[] args) {
        
        PessoaExtendido p2 = new PessoaExtendido("Paulo", 30);
        PessoaMaisExtendido p1 = new PessoaMaisExtendido("Ana", 22);
        
        p1.Mudar_Telefone(25709494);
        p2.Mudar_Telefone(00000000);
        
        p1.setPais("Brasil");
        p1.setIdioma("Portugues");
        
    System.out.println("Objeto p1 Caracteristicas");
    System.out.println("Nome: " + p1.getNome());
    System.out.println("Idade: " + p1.getIdade());
    System.out.println("Telefone: " + p1.getTelefone());
    System.out.println("Idioma: " + p1.getIdioma());
    p1.Meu_Pais();
    System.out.println(" ");

    System.out.println("Objeto p2 Caracteristicas");
    System.out.println("Nome: " + p2.getNome());
    System.out.println("Idade: " + p2.getIdade());
    System.out.println("Telefone: " + p2.getTelefone());
    }   
}
```
Percebe-se nos exemplos de Metaclasse e Conversãao de Tipos que para passar o código de Groovy pra Java necessita de uma reestruturação do código Java. Mostrando assim que Groovy é mais expressiva que Java.

# Conclusão
Embora seja uma linguagem de Script, para aqueles que já programam em Java, o Groovy se torna uma maneira amigável de programar, dada a sua familiaridade e a sua fácil integração com Java. É uma linguagem de fácil aprendizagem e é uma linguagem expressiva, concisa e legível. 

# Bibliografia
http://www.wikipedia.org/

http://www.itexto.net/devkico/?p=535

https://tccjaugustosaba.wordpress.com/2010/04/15/programacao-baseada-em-prototipos/

http://www.devmedia.com.br/orientacao-a-objetos-com-javascript/33718

https://saviofreitas.wordpress.com/2011/03/20/groovy-o-que-e-como-funciona-vale-a-pena/

https://en.m.wikipedia.org/wiki/Prototype-based_programming

http://www.guj.com.br/t/groovy-para-que/154825

https://imasters.com.br/linguagens/java/porque-eu-uso-groovy/?trace=1519021197&source=single

http://melix.github.io/javadayriga2013/#slide-8

https://en.m.wikipedia.org/wiki/Groovy_(programming_language)#History

http://www.itexto.net/devkico/?p=535

https://stackoverflow.com/questions/2323699/groovy-prototype-object

http://mrhaki.blogspot.com.br/2009/11/groovy-goodness-add-methods-dynamically.html

http://groovy-lang.org/metaprogramming.html

