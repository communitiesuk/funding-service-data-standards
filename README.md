# MHCLG Funding Data Standards Technical Documentation

This project is an alpha/proof of concept site to publish the processes and technical documentation (including data standard schemas) for the Ministry of Housing, Community's and Local Government's (MHCLG) Funding Data Standards.

This project uses the [Tech Docs Template][template], which is a [Middleman template][mmt] that you can use to build technical documentation using a GOV.UK style.

While the Tech Docs Template this site has been based on has now been archived, the documentation guidance is still available on their [GitHub Repo][tdt-docs], or a summarised guide has been [published by Mat Moore][tdt-guidance]. The [Tech Docs Ruby gem][gem] that controls the styling and rendering is still being updated and maintained, and is used by GOV.UK services for API and technical documentation, including:

- [GOV.UK developer docs][govuk-dev-docs]
- [GOV.UK Notify documentation][notify-docs]
- [GOV.UK Pay documentation][pay-docs]
- [GDS Way][gds-way]
- [MoJ Cloud Platform User Guide][moj-docs]
- [Content API documentation][content-api]

## Before you start

To use this project, you need to install:

- [Ruby][install-ruby] (we'd suggest installing Ruby via [RBenv][install-rbenv] or [RVM][install-rvm])
- [Middleman][install-middleman]

## Making changes

To make changes to the documentation, edit files in the `source` folder of this repository.

You can add content by editing the `.html.md.erb` files. These files support content in:

- Markdown
- HTML
- Ruby

You can use Markdown and HTML to generate different content type. See the [guidance published by Mat Moore][tdt-guidance-write] for more specifics on adding styling in Markdown and HTML.

You can structure the site pages using subfolders and `index.html.md.erb` files in their roots.

You can change the site config by editing the `config/tech-docs.yml` file.

## Updating JSON Schemas

Each data standard page has a JSON schema section so that implementers and stakeholders can see the full list of data points being collected, their data types, suggested validation rules and how the data standards are linked.

For developer ease (syntax checks etc.) the schemas and any referenced schemas which are not part of a main data standard are saved as JSON schema files in the `schemas` folder. They should be updated here and then the full schema can be copied to the relevant data standard or referenced schema page to ensure they remain consistent.

## Preview your changes locally

To preview your new website locally, navigate to your project folder and run:

```sh
bundle exec middleman server
```

See the generated website on `http://localhost:4567` in your browser. Any content changes you make to your website will be updated in real time.

To shut down the Middleman instance running on your machine, use `ctrl+C`.

If you make changes to the `config/tech-docs.yml` configuration file, you need to restart Middleman to see the changes.

## Build

To build the HTML pages from content in your `source` folder, run:

```sh
bundle exec middleman build
```

Every time you run this command, the `build` folder gets generated from scratch. This means any changes to the `build` folder that are not part of the build command will get overwritten.

## Publish

Merges to the `main` branch on the [Funding Service Data Standards][ds-repo] will trigger a [GitHub workflow][gh-workflow] which will build the HTML pages, compile them into a tar artifact and deploy this to GitHub pages.

## Troubleshooting

Run `bundle update` to make sure you're using the most recent Ruby gem versions.

Run `bundle exec middleman build --verbose` to get detailed error messages to help with finding the problem.

## Licence

The codebase is released under [the MIT License][licence].
This covers both the codebase and any sample code in the documentation.

The documentation is [© Crown copyright][copyright] and available under the terms of the [Open Government 3.0][ogl] licence.

[licence]: https://github.com/communitiesuk/funding-service-data-standards/blob/main/LICENSE
[copyright]: http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/
[ogl]: http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/
[mmt]: https://middlemanapp.com/advanced/project_templates/
[install-ruby]: https://www.ruby-lang.org/en/
[install-rbenv]: https://github.com/rbenv/rbenv
[install-rvm]: https://rvm.io/
[install-middleman]: https://middlemanapp.com/basics/install/
[gem]: https://github.com/alphagov/tech-docs-gem
[tdt-docs]: https://github.com/alphagov/tdt-documentation/tree/main/source
[tdt-guidance]: https://matmoore.github.io/tdt-documentation/index.html
[tdt-guidance-write]: https://matmoore.github.io/tdt-documentation/write_docs/content/index.html
[template]: https://github.com/alphagov/tech-docs-template
[ds-repo]: https://github.com/communitiesuk/funding-service-data-standards
[gh-workflow]: https://github.com/communitiesuk/funding-service-data-standards/blob/main/.github/workflows/publish.yml
[content-api]: https://content-api.publishing.service.gov.uk/
[govuk-dev-docs]: https://docs.publishing.service.gov.uk/
[notify-docs]: https://docs.notifications.service.gov.uk/
[pay-docs]: https://docs.payments.service.gov.uk/
[moj-docs]: https://user-guide.cloud-platform.service.justice.gov.uk/
[gds-way]: https://gds-way.digital.cabinet-office.gov.uk/