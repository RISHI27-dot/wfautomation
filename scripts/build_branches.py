import argparse 
import subprocess 

def main(members): 
    path = './linux_build_scripts.sh' 
    build_type = '-l' if members[0] == 'linux' else '-t'
    branch_list = members[1:]
    branch = branch_list[0]

    try:
        result = subprocess.run([path, build_type, branch, '~/ti-linux-kernel/'], capture_output=True, text=True, check=True)
        # print(result.stdout)
    except subprocess.CalledProcessError as e:
        print("Error executing script:", e)
        print("Output:", e.output)
    branch = branch_list

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Process a list of members.')
    parser.add_argument('members', nargs='+', help='List of members')

    args = parser.parse_args()
    main(args.members)
