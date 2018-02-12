FROM nginx

MAINTAINER Rafael Corrêa Gomes <rafaelcg_stz@hotmail.com>

VOLUME "/usr/share/nginx/html"
WORKDIR "/usr/share/nginx/html"

# Add brightbox
# RUN apt-get update \
# RUN apt-get install -y software-properties-common \
# RUN apt-add-repository -y ppa:brightbox/ruby-ng-experimental

# Install Ruby
RUN apt-get update \
    && apt-get install -y ruby ruby-dev

# Install deps
RUN apt-get install -y \
        software-properties-common \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libxml2-dev \
        libxslt1-dev \
        git \
        vim \
        awscli \
        nodejs 
        
RUN apt-get install -y \        
        npm

# Gem install
RUN  gem install --no-document bundler redcarpet kramdown maruku rdiscount RedCloth liquid pygments \
        && gem install --no-document sass safe_yaml html-proofer execjs \        
        && gem install --no-document jekyll \
        && gem install --no-document jekyll-paginate jekyll-sass-converter jekyll-watch jekyll-gist \
        jekyll-sitemap jekyll-feed jekyll-redirect-from

CMD ["nginx", "-g", "bash;"]
