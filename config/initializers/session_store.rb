# frozen_string_literal: true

KithubMembersSite::Application.config.session_store :redis_store,
                                                    servers: ['redis://redis:6379/0/session'],
                                                    expire_after: 90.minutes
