
# 🎬 Banco de Dados - TBFilmes

Este projeto consiste na criação de um **banco de dados relacional** chamado **`tbfilmes`**, que simula uma plataforma de streaming parecida com a Netflix.  
O banco contém informações sobre filmes, autores, atores, avaliações, salários e produtoras, além de todas as relações entre eles.  

---


## 🗂 Estrutura do Banco de Dados
(Aqui entram as tabelas…)
## 🗂 Estrutura do Banco de Dados
(Aqui entram as tabelas…)

## 🗂 Estrutura do Banco de Dados

### 📌 Tabelas criadas

#### 1. `tbfilmes`
| Campo           | Tipo          | Restrição                       |
|-----------------|--------------|---------------------------------|
| codfilme        | INT          | PK, AUTO_INCREMENT, NOT NULL    |
| nomefilme       | VARCHAR(255) | NOT NULL                        |
| duracaominutos  | INT          |                                 |
| anolacamento    | DATE         | DEFAULT '2008-01-01'            |
| avaliacao       | DECIMAL      | NOT NULL                        |

---

#### 2. `tbautorfilme`
| Campo          | Tipo          | Restrição                       |
|----------------|--------------|---------------------------------|
| codautor       | INT          | PK, AUTO_INCREMENT, NOT NULL    |
| nomeautor      | VARCHAR(100) | NOT NULL                        |
| nacimentoautor | DATE         |                                 |
| idadeautor     | INT          | CHECK (idadeautor >= 18)        |
| filme          | INT          | FK → `tbfilmes(codfilme)`       |

---

#### 3. `tbator`
| Campo      | Tipo          | Restrição                       |
|------------|--------------|---------------------------------|
| codator    | INT          | PK, AUTO_INCREMENT, NOT NULL    |
| nomeator   | VARCHAR(100) | NOT NULL                        |
| nacimento  | DATE         | DEFAULT '2007-01-01'            |
| idadeator  | INT          | CHECK (idadeator >= 18)         |
| codtbfilme | INT          | FK → `tbfilmes(codfilme)`       |

---

#### 4. `tbprecofilmeautor`
| Campo       | Tipo | Restrição                       |
|-------------|------|---------------------------------|
| salarioautor| INT  | PK                              |
| codautor    | INT  | FK → `tbautorfilme(codautor)`   |
| codfilme    | INT  | FK → `tbfilmes(codfilme)`       |

---

#### 5. `tbprecoatorfilme`
| Campo       | Tipo | Restrição                     |
|-------------|------|-------------------------------|
| salarioator | INT  |                               |
| codtbator   | INT  | FK → `tbator(codator)`        |
| codtbfilme  | INT  | FK → `tbfilmes(codfilme)`     |

---

#### 6. `tbavaliacaoespecialista`
| Campo             | Tipo          | Restrição                       |
|-------------------|--------------|---------------------------------|
| codespecialista   | INT          | PK, AUTO_INCREMENT, NOT NULL    |
| nomespecialista   | VARCHAR(100) | NOT NULL                        |
| codfilmeavaliado  | INT          | FK → `tbfilmes(codfilme)`       |
| nota              | FLOAT        |                                 |

---

#### 7. `tbprodutora`
| Campo             | Tipo          | Restrição                       |
|-------------------|--------------|---------------------------------|
| codprodutora      | INT          | PK, NOT NULL, CHECK >= 0        |
| nomeprodutora     | VARCHAR(100) | NOT NULL                        |
| codfilmeprodutora | INT          | FK → `tbfilmes(codfilme)`       |

---

## 🔗 Relacionamentos Principais
- Um **filme** pode ter **vários autores** e **atores**.
- Cada **ator/autor** está vinculado a **um filme** através de **chaves estrangeiras**.
- Os **salários** de autores e atores são controlados em tabelas próprias (`tbprecofilmeautor` e `tbprecoatorfilme`).
- As **avaliações de especialistas** também estão ligadas diretamente aos filmes.
- Cada filme pertence a **uma produtora**.

---

## 📊 Dados Inseridos
- **50 filmes** cadastrados.
- **50 autores** associados aos filmes.
- **50 atores** relacionados aos filmes.
- **43 registros de salários de autores**.
- **50 registros de salários de atores**.
- **50 avaliações de especialistas**.
- **50 produtoras** diferentes, cada uma responsável por um filme.

---

## ✅ Exemplos de Consultas
- Listar todos os filmes:
  ```sql
  SELECT * FROM tbfilmes;
