# About
This is docker configuretion for building and serving a documents using mkdocs

# How to use

```
docker-compose up -d
```

# How to configure

This configuretion include 'plantuml-markdon' package.  
You can set as below configuration for mkdocs.yml then see the UML dialog by plantuml.
I recommend you by remote rendering setting if you make many diagrams.

```
site_name: My Docs
theme:
  name: 'material'

markdown_extensions:
  - plantuml_markdown:
      server: http://www.plantuml.com/plantuml
      format: svg_inline
      title: UML diagram
      alt: UML diagram svg image
```

