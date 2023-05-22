package slack

import (
	"context"
	"errors"
	"fmt"
	"time"

	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/retry"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	"github.com/slack-go/slack"
)

func ListUserGroupsWithContext(
	ctx context.Context,
	d *schema.ResourceData,
	m interface{},
	includeDisabled bool,
) ([]slack.UserGroup, error) {
	client := m.(*slack.Client)

	var (
		userGroups []slack.UserGroup
		//nolint:gomnd
		backoff = &Backoff{Base: time.Second, Cap: 15 * time.Second}
	)
	err := retry.RetryContext(ctx, d.Timeout(schema.TimeoutRead), func() *retry.RetryError {
		var (
			err   error
			rlerr *slack.RateLimitedError
		)

		userGroups, err = client.GetUserGroupsContext(
			ctx,
			slack.GetUserGroupsOptionIncludeDisabled(includeDisabled),
			slack.GetUserGroupsOptionIncludeUsers(true),
		)

		if errors.As(err, &rlerr) {
			backoff.Sleep(ctx)
			return retry.RetryableError(err)
		}

		if err != nil {
			return retry.NonRetryableError(fmt.Errorf("couldn't get usergroups: %w", err))
		}

		return nil
	})

	return userGroups, err
}
