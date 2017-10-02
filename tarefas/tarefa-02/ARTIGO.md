# Groovy

# Introdução
O Groovy é uma linguagem orientada a objeto e dinamicamente tipada voltada para a plataforma Java e destinada a melhorar a produtividade do desenvolvedor apresentando uma sintaxe concisa, familiar e fácil de aprender. A linguagem Groovy utiliza uma sintaxe similar à de Java, é compilada dinamicamente para bytecode Java, e integra-se transparentemente com outros códigos e bibliotecas Java.

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
1.  No Groovy todos os atributos de uma classe são por padrão publico.

2. Em Java para declarar um método público é necessário digitar public. No Groovy não, pois por padrão já são públicos.

3. Na linguagem Java é obrigatório a digitar os get’s e set’s para expor os atributos dos objetos. No Groovy não, eles serão automaticamente e dinamicamente gerados.

4. O Groovy é um superconjunto do Java, o que significa que um programa Java funcionará bem no ambiente Groovy, mas vice-versa pode ou não ser executado, dependendo se está escrito em groovy ou Java.

5. Quanto à legibilidade temos as seguintes características:
    5.1 O Groovy fornece métodos de fácil escrita, como:
	```groovy
	System.out.println(“ola”)    //em java
	println ()*		//em groovy
	```

    5.2 Groovy suporta a suporta a substituição de variáveis usando aspas duplas, ou seja, você pode imprimir conteúdo dinâmico sem usar concatenação de string, por exemplo: 
	*println ( “Bom dia $nome!” );*

    5.3 Especificar o tipo. Em Java é obrigatório, mas em Groovy é opcional. Em Groovy é possível determinar uma tipagem dinâmica utilizando a palavra chave ***def***. Em Java se o tipo não for especificado o código não é compilado.
    
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
6. Em Java, você precisa do método principal para tornar uma classe executável, no Groovy você não precisa disso. Uma vez que o Groovy é uma linguagem de script, existe automaticamente uma classe de wrapper chamada Script para cada programa. Isso significa que você pode se livrar de sua própria classe de embrulho, bem como o método principal, assim:
```groovy
def salve (nome) {
         println ( "Bom dia $ nome!" );
 }
 def name = 'Steve'
 cumprimentar (nome)

```
7. Importação default. Os seguintes pacotes e classes são importados por default, sendo desnecessário usar *import* explícito para utilizá-los:
* java.io
* java.lang
* java.math.BigDecimal
* java.math.BigInteger
* java.net
* java.util
* java.lang
* groovy.lang
* groovy.util


## Exemplo de códigos representativos 

Os exemplos abaixo demonstram que a linguagem Groovy tem uma legibilidade maior que a do Java.

### Hello World 
- java
```java
public class HelloWorld {
   public static void main(String[] args) {
      System.out.println("Hello World!");
   }
}
```
- groovy
```groovy
println "Hello World!"
```

### Criando um List e um Map em Java
 - java
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
- groovy
```groovy
List minhaLista = ["maçã", "laranja", "limão"]
Map meuMap = [3: "três", 6: "seis", 1: "um"];
```

### Conversão de Tipos 
- java 
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
- groovy
```
>> a = "10"
>> a + 20
>> 1020
>> a = 10
>> a + 20
>> 30
```

# Reflexão
Reflexão é um recurso da API Java que possibilita aos aplicativos o acesso e a modificação do comportamento de aplicações que estão rodando na Java Virtual Machine.
Em Java, o pacote java.lang.reflect permite exibir o nome de atributos e métodos pertencentes a uma classe, em tempo de execução.
Uma classe pode acessar outras classes em tempo de execução, sem conhecer sua definição no momento da compilação. Informações relativas à esta definição, como seus construtores, métodos e atributos, podem ser facilmente acessados através de métodos de reflexão da API Java. 
Em Groovy isso é feito de forma mais simples por se tratar de uma linguagem com comportamento dinâmico. Podemos perceber essa diferença nos exemplos abaixo:

### Java
 _Classe Pessoa_
```java
package projetoexemplo;

public class Pessoa {
    
    public String nome;
    public int idade;
    private String telefone;
    private String endereco;
    
    public String getNome() { return nome;  }

    public void setNome(String nome) { this.nome = nome;}

    public int getIdade() { return idade;  }

    public void setIdade(int idade) { this.idade = idade;}
    
    public String getEndereco() { return endereco; }

    public void setEndereco(String endereco) { this.endereco = endereco; }
    
    public String getTelefone() { return telefone;}

    public void setTelefone(String telefone) { this.telefone = telefone; }
}

```

_Classe Main_
```java
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Parameter;
Import projetoexemplo.Pessoa;


public class ProjetoExemplo {
    public static void main(String[] args) {
          
        Class classe = Pessoa.class;
        Pessoa p1 = new  Pessoa();   
        p1.setNome("Ana Paula");
        p1.setIdade(30);
        p1.setTelefone("25698571");
                
    //Recuperando informações da classe pessoa
        for (Field field : classe.getDeclaredFields()){   
            String campo = field.getName();
            Class tipo = field.getType();
            String nomeTipo = tipo.getTypeName();
            System.out.println("Campo: " + campo + " ,  Tipo: " + nomeTipo ); 
            System.out.println("Acessibilidade: " +  Modifier.toString(field.getModifiers()));
            System.out.println("Tem acesso: " + field.isAccessible());
            
            try {               
                //field.setAccessible(true); 
                System.out.println("valor = " + field.get(p1) + "\n");                              
            } catch (Exception e) {
                 System.out.println("valor = não pode acessar valor\n");
            }      
         }
        
        System.out.println("");
     //Recuperando os metodos da classe pessoa
        for (Method method : classe.getDeclaredMethods()){
            String nome = method.getName();
            Class tipoRetorno = method.getReturnType();           

            System.out.println("Método : " + nome + "  Tipo de retorno: " + tipoRetorno);
            System.out.println("Acessibilidade: " +  Modifier.toString(method.getModifiers()));
            
            //Recuperandos os parâmetros do método
            Class parametros[] = method.getParameterTypes();
            
            System.out.println("Parâmetros: ");
            for (Class c : parametros){
                System.out.println("\t" + c.getName());        
            }
            System.out.println("");      
        }
    } 
 }   
```

### Groovy
```groovy
import java.lang.reflect.Modifier

class Pessoa {
    String nome
    String endereco
    String telefone
    
    Pessoa(String Nome, String Endereco, String Telefone){
        this.nome = Nome
        this.endereco = Endereco
        this.telefone = Telefone
    }
    
    def digaOla(){ return 'Ola Pessoal!!!'  }
}

Pessoa.metaClass.idade = 0

def p1 = new Pessoa("Ana Paula", "Avenida Maracana", "25368547")

Pessoa.metaClass.setIdade(){int idade -> delegate.idade = idade}

Pessoa.metaClass.Mudar_Telefone(){String num -> delegate.telefone = num}

p1.setIdade(30)

 println "Nome: " + p1.nome
 p1.Mudar_Telefone("123568875")
 println "Telefone: " + p1.telefone
 println "Idade: " + p1.idade
 println p1.digaOla()
 
println "\n METODOS \n"
println Pessoa.metaClass.getMethods().name.sort().unique() + "\n\n"

List<MetaMethod> listaMetodos =  Pessoa.metaClass.getMethods()

for (MetaMethod m : listaMetodos){
    println "Nome='" + m.name + "'   retorno= " + m.getReturnType()
    println "Assinatura : "+ m.getSignature()
    println "Parametros : \n\t" + m.getParameterTypes() 
    println "Acesso= " + Modifier.toString(m.getModifiers()) + "\n"
}

println "\n ATRIBUTOS\n"
println Pessoa.metaClass.getProperties().name.unique()
println " "

List<MetaProperty> listaPropriedade =  Pessoa.metaClass.getProperties()

for (MetaProperty p : listaPropriedade){
    println "Nome='" + p.name + "'   Tipo= " + p.type 
    println "Acesso= " + Modifier.toString(p.getModifiers()) + "\n"
}
```

# Prototipação e MetaProgramação em Groovy

O conceito de Prototipação trata-se de uma forma de programação orientada a objeto onde novos objetos são criados a partir da clonagem de objetos existentes que são os chamados protótipos. Permite que novos objetos tenham novos comportamentos através do processo de expansão do comportamento de objetos já existentes.

Quanto às classes, elas podem ter a adição de novas funcionalidades através da extensão de classes já existentes. Os objetos herdam essas novas funcionalidades, porem esses podem ter funcionalidades exclusivas deles, a partir de sua expansão. Toda sua estrutura pode ser alterada em tempo de execução.

A funcionalidade Metaprogramação presente em Groovy permite utilizar o conceito de prototipação, porém não completamente, o que permite é apenas a expansão de classes e objetos em tempo de execução. 

O uso de Metaclasse permite que classes e objetos sejam alterados em tempo de execução. Utiliza as regras provenientes do MOP (Meta-Object Protocol) para a realização da expansão. Ao utilizar **metaClass** em uma classe define-se o  novo método da classe e de suas instancias. Ao utilizar **metaClass** em um objeto, apenas este terá o método ou atributo, ou seja, será uma característica exclusiva daquele objeto.


### Exemplo de códigos representativos 
* Adicionando um novo método à classe String

```groovy
String.metaClass.digaOla = { lang -> if (lang == 'English') println 'Hello'
else  if (lang == 'Swedish') println 'Hej'
}

'Chamando o diga Olá por uma String'.digaOla('Swedish')
```

* Adicionando comportamentos diferentes em objetos da mesma classe
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
assert cat.miar() == "miau miau"

println " " 
println "Caracteristicas Cachorro"
println "Nome: " + dog.nome 
println "Idade: " + dog.idade
println "Tipo: " + dog.tipo
println "Raca: " + dog.raca
dog.latir()
assert dor.latir() == "au au"

```
* Adicionando novos atributos em classe e objetos
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

```

# Conclusão
Embora seja uma linguagem de Script, para aqueles que já programam em Java, o Groovy se torna uma maneira amigável de programar, dada a sua familiaridade e a sua fácil integração com Java. 

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

https://www.tutorialspoint.com/java/lang/class_getmethods.htm

http://groovy-almanac.org/list-the-methods-of-a-groovy-class/

http://groovy-lang.org/metaprogramming.html#_get_setmetaclass

https://stackoverflow.com/questions/30666487/how-does-the-getmodifiers-method-calculate-the-value-for-multiple-modifiers


