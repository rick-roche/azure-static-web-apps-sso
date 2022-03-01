# azure-static-web-apps-sso

[![Deploy Infra and App](https://github.com/rick-roche/azure-static-web-apps-sso/actions/workflows/deploy.yaml/badge.svg)](https://github.com/rick-roche/azure-static-web-apps-sso/actions/workflows/deploy.yaml)

This repo provides the implementation for my [Single Sign-On, Azure Static Web Apps and Azure Active Directory](https://www.rickroche.com/2022/03/single-sign-on-azure-static-web-apps-and-azure-active-directory/) blog post.

## Overview

The experience I wanted to achieve was that if a user internal to an Azure Active Directory tenant browsed to an internal app using [Azure Static Web Apps](https://azure.microsoft.com/en-us/services/app-service/static/), they would be logged in using SSO - no login button, just a seamless logged-in user experience.

Technologies used
* [Azure Static Web Apps](https://azure.microsoft.com/en-us/services/app-service/static/)
* [Azure Active Directory](https://azure.microsoft.com/en-us/services/active-directory/)
* [Azure Key Vault](https://azure.microsoft.com/en-us/services/key-vault/)

## Context

![c4 context](https://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/rick-roche/azure-static-web-apps-sso/main/docs/diagrams/context.puml "Context")

## Internal Web App Containers

![c4 container](https://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/rick-roche/azure-static-web-apps-sso/main/docs/diagrams/container-webapp.puml "Internal Web App")
