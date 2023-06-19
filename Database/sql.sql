use tarefas;
show tables;
desc Reservation;
desc Travel;
desc Local;
insert into Local(Name,Description,image) values(
	'Foz do igualçu',
	'Foz do Iguaçu é uma cidade localizada na região sul do Brasil, no estado do Paraná. É conhecida por abrigar uma das maiores atrações naturais do mundo, as Cataratas do Iguaçu, que são um conjunto de quedas dágua de tirar o fôlego. Além disso, a cidade é marcada por sua diversidade cultural, com influências do Brasil, Paraguai e Argentina, já que faz fronteira com esses dois países.',
	'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/9b/2d/ce/foz-do-iguacu.jpg?w=700&h=500&s=1'
);
insert into Local(Name,Description,image) values(
	'Paris',
	'Paris é uma cidade icônica, conhecida por sua arquitetura deslumbrante, história rica e cultura refinada. A Torre Eiffel é o ponto turístico mais famoso da cidade, oferecendo vistas panorâmicas impressionantes. A Catedral de Notre-Dame, o Museu do Louvre, o Arco do Triunfo e o bairro charmoso de Montmartre são apenas algumas das atrações imperdíveis que Paris tem a oferecer. Além disso, os visitantes podem desfrutar de deliciosas iguarias francesas, como croissants, queijos e vinhos refinados.',
	'https://www.vounajanela.com/wp-content/uploads/2022/01/paris-31.jpg'
);
insert into Local(Name,Description,image) values(
	'Tóquio',
	'Tóquio é uma cidade vibrante e futurista, combinando tradições milenares com a modernidade. Os visitantes podem explorar os bairros únicos da cidade, como Shibuya e Harajuku, famosos por sua moda e cultura jovem. O Templo de Meiji, o Palácio Imperial e o Mercado de Tsukiji são alguns dos destaques turísticos. Além disso, Tóquio é famosa por sua culinária excepcional, com sushi, ramen e tempura sendo alguns dos pratos mais populares.',
	'https://www.gotokyo.org/es/plan/tokyo-outline/images/main.jpg'
);
insert into Local(Name,Description,image) values(
	'Rio de Janeiro',
	'O Rio de Janeiro é conhecido por suas belas praias, montanhas impressionantes e carnaval animado. A estátua do Cristo Redentor, no topo do Morro do Corcovado, oferece uma vista panorâmica deslumbrante da cidade. As praias de Copacabana e Ipanema são mundialmente famosas, e o Pão de Açúcar é outra atração imperdível. O bairro histórico de Santa Teresa, o Jardim Botânico e a animada vida noturna da Lapa também são pontos turísticos populares no Rio de Janeiro.',
    'https://www.costacruzeiros.com/content/dam/costa/inventory-assets/ports/RIO/c035_rio_de_janeiro.jpg'
);

select * from Local; 
select * from Users;
