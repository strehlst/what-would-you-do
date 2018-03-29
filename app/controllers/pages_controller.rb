# frozen_string_literal: true

class PagesController < ApplicationController
  include MetricsHelper
  include ImageHelper
  def about
  end

  # rubocop:disable Metrics/MethodLength
  def calendar
    @events = [
      { title: 'xFuture Meetup on Universal Basic Income',
        city: 'Porto',
        location: 'Founders Founders: Founders Café',
        date: '2018-04-19T18:45:00',
        category: 'Automatização',
        organizer: 'xFuture',
        url: 'https://www.meetup.com/de-DE/xFuturemeetup/events/248678828/' },
      { title: 'Unconditional Basic Income Night',
        city: 'Braga',
        location: 'Braga i/o',
        date: '2018-03-28T19:00:00',
        category: 'Futuro do trabalho',
        organizer: 'Meu Rendimento Básico',
        url: 'https://www.facebook.com/events/163907141091705/' },
      { title: 'sense_drink: Basic Income Movie Night',
        city: 'Porto',
        location: 'Porto i/o Riverside',
        date: '2018-03-27T19:00:00',
        category: 'Impacto social',
        organizer: 'MakeSense Hotspot Porto',
        url: 'https://www.facebook.com/events/204533683478164/' },
      { title: 'Cine Conversa "Free Lunch Society"',
        city: 'Porto',
        location: 'Livraria Gato Vadio',
        date: '2018-03-23T21:30:00',
        category: 'Direitos Humanos',
        organizer: 'LGBTripeir@s',
        url: nil },
      { title: 'Unconditional Basic Income Night',
        city: 'Porto',
        location: 'Porto i/o Downtown',
        date: '2018-03-22T19:00:00',
        category: 'Futuro do trabalho',
        organizer: 'Porto i/o',
        url: nil }
    ]
  end
  # rubocop:enable Metrics/MethodLength

  def contact
  end

  def frontpage
    load_metrics
    @dreams = Dream.by_popularity_desc(5)
    @latest_embraces = Embrace.includes(:user, :dream).created_at_desc.limit(10)
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def articles
    # rubocop:disable Metrics/LineLength
    @articles = [
      { title: 'No limiar duma (r)evolução?',
        category: t('dictionary.innovation'),
        author: 'Vicente Ferreira da Silva',
        publisher: 'Observador',
        tags: [t('dictionary.robot_tax'), t('dictionary.automisation'), t('dictionary.work')],
        date: '2018-03-21',
        curated: false,
        url: 'https://observador.pt/opiniao/no-limiar-duma-revolucao/' },
      { title: 'Sindicatos e patrões concordam com combate à pobreza mas divergem na forma',
        category: t('dictionary.economy'),
        author: 'LUSA',
        publisher: 'Diário de Notícias',
        tags: [t('dictionary.poverty'), t('dictionary.unions'), t('dictionary.un_employment')],
        date: '2018-03-21',
        curated: false,
        url: 'https://www.dn.pt/lusa/interior/sindicatos-e-patroes-concordam-com-combate-a-pobreza-mas-divergem-na-forma-9205204.html' },
      { title: 'Enfrentar o futuro',
        category: t('dictionary.economy'),
        author: 'Cristina Casalinho',
        publisher: 'Jornal de Negócios',
        tags: [t('dictionary.automization'), t('dictionary.un_employment')],
        date: '2018-03-08',
        curated: false,
        url: 'https://www.jornaldenegocios.pt/opiniao/colunistas/cristina-casalinho/detalhe/enfrentar-o-futuro' },
      { title: 'Homem da “geringonça” faz um aviso ao atual PSD (e outro ao PSD do futuro)',
        category: t('dictionary.politics'),
        author: 'Rita Tavares',
        publisher: 'Observador',
        tags: [t('dictionary.taxes')],
        date: '2018-02-15',
        curated: false,
        url: 'https://observador.pt/2018/02/15/homem-da-geringonca-faz-um-aviso-ao-atual-psd-e-outro-ao-psd-do-futuro/' },
      { title: 'Rendimento Básico Incondicional: uma despesa pública justa?',
        category: t('dictionary.politics'),
        author: 'Maria d\'Oliveira Martins',
        publisher: 'Observador',
        tags: [t('dictionary.social_welfare')],
        date: '2018-02-15',
        curated: false,
        url: 'https://observador.pt/opiniao/rendimento-basico-incondicional-uma-despesa-publica-justa/' },
      { title: 'Igreja Católica destaca urgência de prosseguir no «caminho de esperança» quanto à devolução de rendimentos',
        category: t('dictionary.work'),
        author: '',
        publisher: 'ECCLESIA',
        tags: [t('dictionary.poverty'), t('dictionary.church')],
        date: '2018-02-14',
        curated: false,
        url: 'http://www.agencia.ecclesia.pt/portal/portugal-trabalho-igreja-catolica-destaca-urgencia-de-prosseguir-no-caminho-de-esperanca-quanto-a-devolucao-de-rendimentos/' },
      { title: 'Rendimento Básico Incondicional? Vai mas é trabalhar!',
        category: t('dictionary.welfare_state'),
        author: 'Luís Aguiar-Conraria',
        publisher: 'Observador',
        tags: [],
        date: '2018-02-07',
        curated: true,
        url: 'Rendimento Básico Incondicional? Vai mas é trabalhar!' },
      { title: '"O Rendimento Básico Incondicional ainda não passou da fase da utopia"',
        category: t('dictionary.interview'),
        author: 'Sónia Sapage',
        publisher: 'PÚBLICO',
        tags: [],
        date: '2018-01-29',
        curated: false,
        url: 'https://www.publico.pt/2018/01/29/politica/entrevista/o-rendimento-basico-incondicional-ainda-nao-passou-da-fase-da-utopia-1801047' },
      { title: 'Rendimento básico: livre de obrigações ou participativo?',
        category: t('dictionary.welfare_state'),
        author: 'Roberto Merrill, Catarina Neves',
        publisher: 'Observador',
        tags: [t('dictionary.society')],
        date: '2018-01-27',
        curated: true,
        url: 'https://observador.pt/opiniao/rendimento-basico-livre-de-obrigacoes-ou-participativo/' },
      { title: '"Rendimento universal seria muito mais justo"',
        category: t('dictionary.society'),
        author: 'Filomena Naves',
        publisher: 'Diário de Notícias',
        tags: [t('dictionary.interview'), t('dictionary.society'), t('dictionary.debate')],
        date: '2017-09-30',
        curated: true,
        url: 'https://www.dn.pt/sociedade/interior/rendimento-universal-seria-muito-mais-justo-8808802.html' },
      { title: 'Rendimento básico entusiasma mais os académicos do que os políticos',
        category: t('dictionary.social_security'),
        author: 'Margarida David Cardoso',
        publisher: 'PÚBLICO',
        tags: [t('dictionary.implementation'), t('dictionary.debate')],
        date: '2017-09-26',
        curated: true,
        url: 'https://www.publico.pt/2017/09/26/sociedade/noticia/rendimento-basico-entusiasma-mais-os-academicos-dos-que-os-politicos-1786673' },
      { title: 'Da Finlândia à Escócia, os testes ao rendimento básico espalham-se pela Europa',
        category: t('dictionary.social_security'),
        author: 'Natália Faria',
        publisher: 'PÚBLICO',
        tags: [t('dictionary.implementation'), t('dictionary.debate')],
        date: '2017-09-26',
        curated: true,
        url: 'https://www.publico.pt/2017/09/26/sociedade/noticia/da-finlandia-a-escocia-os-testes-ao-rendimento-basico-espalhamse-pela-europa-1786652' },
      { title: 'Rendimento básico incondicional em debate',
        category: t('dictionary.economy'),
        author: 'Antena 1',
        publisher: 'RTP Notícias',
        tags: [t('dictionary.audio'), t('dictionary.debate')],
        date: '2017-09-25',
        curated: true,
        url: 'https://www.rtp.pt/noticias/economia/rendimento-basico-incondicional-em-debate_a1029281' },
      { title: 'Rendimento Básico Incondicional. Uma solução para Portugal?',
        category: t('dictionary.society'),
        author: 'RTP',
        publisher: 'RTP Notícias',
        tags: [t('dictionary.video'), t('dictionary.implementation')],
        date: '2017-09-11',
        curated: true,
        url: 'https://www.rtp.pt/noticias/economia/rendimento-basico-incondicional-uma-solucao-para-portugalt_v1030514' }
    ]
    # rubocop:enable Metrics/LineLength
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  def not_found
    render 'not_found', status: 404
  end
end
