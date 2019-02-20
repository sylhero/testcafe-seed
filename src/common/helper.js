import chalk from 'chalk';

/* eslint-disable */
const helper = () => {
    const username = process.env.username;
    const password = process.env.password;
    const baseUrl = process.env.baseUrl;
    const env = process.env.env;

    if(!username || !password || !env || !baseUrl) {
        console.log(chalk.red('Please export the username, password, baseUrl and env'));
        process.exit(1);
    }
    console.log(chalk.blue('username is: ') + chalk.green(username));
    console.log(chalk.blue('password is: ') + chalk.green(password));
    console.log(chalk.blue('baseUrl is: ') + chalk.green(baseUrl));
    console.log(chalk.blue('env is: ') + chalk.green(env));

    return {
        username,
        password,
        baseUrl,
        env
    }
};

const Helper = helper();

export default Helper;
