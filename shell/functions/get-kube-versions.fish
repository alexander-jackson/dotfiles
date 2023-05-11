function get-kube-versions
	argparse "n/namespace=" "service=" "context=" -- $argv
	or return

	k --context $_flag_context -n $_flag_namespace get pods \
		--selector=app=$_flag_service \
		-o=jsonpath="{range .items[*]}{.spec.containers[*].image}{'\n'}{end}" | \
		sd -s "eu.gcr.io/starlingbank/" "" | \
		sd "inotify-s3:[\d.]+ ?" "" | \
		sort | \
		uniq -c
end
